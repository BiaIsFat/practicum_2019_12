package servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import dao.SessionSeatDao;
import service.*;
import serviceImpl.*;

/**
 * Servlet implementation class SessionSeatServlet
 */
@WebServlet("/sessionseat/*")
public class SessionSeatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionSeatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 获取部分URL：/example/film/one.do
        String path = request.getRequestURI();
        // 获取方法前部分长度：/example/film/
        int head_length = (request.getContextPath() + request.getServletPath()).length() + 1;
        String method_name = path.substring(head_length, path.indexOf(".do"));
        System.out.println(this.getClass().getName() + " : " + method_name + "\n");
        try {
            Method method = getClass().getDeclaredMethod(method_name, HttpServletRequest.class,
                    HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Generate order information but has not added into database yet
    // 12.24
    protected void findOne(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // int ssno = Integer.valueOf(request.getParameter("ssno"));
//	    int rno = Integer.valueOf(request.getParameter("rno"));
//	    int sno=Integer.valueOf(request.getParameter("sno"));
        // get session-seats no
        String[] ssno_array = request.getParameterValues("ssno");
        int[] ssno = new int[ssno_array.length];
        for (int i = 0; i < ssno_array.length; i++) {
            ssno[i] = Integer.valueOf(ssno_array[i]);
        }
        // get total price
        double total = Double.valueOf(request.getParameter("total"));
        // get session no
        long sno = Long.valueOf(request.getParameter("sno"));

        SessionSeatService sseat_service = new SessionSeatServiceImpl();
        CinemaService cinema_service = new CinemaServiceImpl();
        
        // Session
        SessionBean session = sseat_service.findsession_one(sno);
        // Film
        FilmBean film = session.getFilm();
        // Cinema
        int cno = session.getRoom().getCno();
        CinemaBean cinema = cinema_service.findOne(cno); 
        // Session-Seats
        List<SessionSeatBean> seat_list = sseat_service.findSeats(ssno);
        // Room
        RoomBean room = session.getRoom();
        // Total price
        
        request.setAttribute("total", total);
        request.setAttribute("session", session);
        request.setAttribute("film", film);
        request.setAttribute("cinema", cinema);
        request.setAttribute("seat_list", seat_list);
        request.setAttribute("room", room);
        request.getRequestDispatcher("/rupay.jsp").forward(request, response);
    }

    // Get all seats of choosen session and search other related informations
    protected void findSeats(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long sno = Long.valueOf(request.getParameter("sno"));

        SessionSeatService ss_service = new SessionSeatServiceImpl();
        CinemaService cinema_service = new CinemaServiceImpl();

        List<SessionSeatBean> ss_list = null;
        SessionBean session = null;
        CinemaBean cinema = null;
        ss_list = ss_service.findSeatsBySno(sno);
        session = ss_service.findsession_one(sno);
        int cno = session.getRoom().getCno();
        cinema = cinema_service.findOne(cno);

        request.setAttribute("ss_list", ss_list);
        request.setAttribute("session", session);
        request.setAttribute("cinema", cinema);
        request.getRequestDispatcher("/seat.jsp").forward(request, response);
    }
    
  //增加场次12.25
    protected void plansession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Begin time
        String  begin_time = request.getParameter("begin_time");
        // End time
        //String end_time= request.getParameter("end_time");
        // Price
        double price = Double.valueOf(request.getParameter("price"));
        // cadmin account
        String account = (String)session.getAttribute("account");
        // Rno
        int rno = Integer.valueOf(request.getParameter("rno"));
        // Fno
        int fno = Integer.valueOf(request.getParameter("fno"));
        
        // 插入数据
        SessionSeatService ss_service = new SessionSeatServiceImpl();
        boolean flag=false;
        flag=ss_service.planSessionSeatInfo(begin_time,price,rno,fno,account);
        if(flag) {
             //request.setAttribute("msg", "插入成功");
             response.sendRedirect(request.getContextPath()+"/room/findByCadmin.do");
         }else {
             request.setAttribute("msg", "插入失败");
             request.getRequestDispatcher("/room/findByCadmin.do").forward(request, response);
         }
    }   
    
    // Select sessions of all cinema
    protected void findSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String uid = (String)session.getAttribute("account");
        List<SessionBean> session_list = null;
        SessionSeatService ss_service = new SessionSeatServiceImpl();
        session_list = ss_service.findSessionsByCadmin(uid);
        
        request.setAttribute("session_list", session_list);
        request.getRequestDispatcher("/film/keySearch.do").forward(request, response);
    }
    
    protected void findOneSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long sno = Long.valueOf(request.getParameter("sno"));
        
        SessionSeatService ss_service = new SessionSeatServiceImpl();
        SessionBean session = ss_service.findsession_one(sno);
        
        request.setAttribute("session", session);
        request.getRequestDispatcher("/updatesee.jsp").forward(request, response);
    }
    
    protected void updateSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sno = Integer.valueOf(request.getParameter("sno"));
        String begin_time = request.getParameter("begin_time");
        double price = Double.valueOf(request.getParameter("price"));
        
        SessionSeatService ss_service = new SessionSeatServiceImpl();
        
        boolean flag = false;
        flag = ss_service.updateSession(sno, begin_time, price);
        
        if(flag) {
            response.sendRedirect(request.getContextPath()+"/room/findByCadmin.do");
        } else {
            request.setAttribute("msg", "update failed");
            request.getRequestDispatcher("/room/findByCadmin.do").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
