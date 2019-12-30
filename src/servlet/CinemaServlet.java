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

import bean.CinemaBean;
import bean.SessionBean;
import service.CinemaService;
import serviceImpl.CinemaServiceImpl;

/**
 * Servlet implementation class CinemaServlet
 */
@WebServlet("/cinema/*")
public class CinemaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CinemaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

    // Search an exact cinema
    protected void findOne(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cno = Integer.valueOf(request.getParameter("cno"));
        HttpSession session = request.getSession();
        
        // 搜索选择的影院
        CinemaService service = new CinemaServiceImpl();
        CinemaBean cinema = null;
        cinema = service.findOne(cno);

        // 搜索对应 影院 电影 的场次
        List<SessionBean> session_list = null;
        if (!request.getParameter("fno").equals("")) {
            int fno = Integer.valueOf(request.getParameter("fno"));
            session_list = service.findSession(fno, cno);
        } else {
            session_list = service.findSession(cno);
        }

        request.setAttribute("session_list", session_list);
        request.setAttribute("cinema", cinema);
        request.getRequestDispatcher("/cinemaDetail.jsp").forward(request, response);
    }

    // Search cinemas by keyword
    protected void keySearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        CinemaService cinema_service = new CinemaServiceImpl();
        List<CinemaBean> cinema_list = null;
        if (keyword == "") {
            findAll(request, response);
        } else {
            cinema_list = cinema_service.findByKeyWord(keyword);
            request.setAttribute("cinema_list", cinema_list);
            request.getRequestDispatcher("/searchCinema.jsp").forward(request, response);
        }
    }

    // Used by homepage
    protected void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CinemaService service = new CinemaServiceImpl();
        List<CinemaBean> cinema_list = service.findAll();

        session.setAttribute("first_index", 1);
        request.setAttribute("cinema_list", cinema_list);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    // Search all cinemas
    protected void findAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CinemaService service = new CinemaServiceImpl();
        List<CinemaBean> cinema_list = service.findAll();
        HttpSession session = request.getSession();

        request.setAttribute("cinema_list", cinema_list);
        if(session.getAttribute("uid")!=null && session.getAttribute("account")!=null) {
            request.getRequestDispatcher("").forward(request, response);
        }
        request.getRequestDispatcher("/searchCinema.jsp").forward(request, response);
    }

    // Search cinemas that have planed sessions of choosen film
    protected void searchByFilm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the film no
        int fno = Integer.valueOf(request.getParameter("fno"));
        // Get cinema list
        CinemaService service = new CinemaServiceImpl();
        List<CinemaBean> cinema_list = service.findByFilm(fno);
        
        request.setAttribute("fno", fno);
        request.setAttribute("cinema_list", cinema_list);
        request.getRequestDispatcher("/searchCinema.jsp").forward(request, response);
    }
    
  //管理员增加影院   跳转还没写好
    protected void addCinema(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cname=request.getParameter("cname");
        String worktime=request.getParameter("worktime");
        String addr=request.getParameter("addr");
        String tel=request.getParameter("tel");
        
        CinemaService add_cinema=new CinemaServiceImpl();
        boolean flag=add_cinema.addCinema(cname,worktime,addr,tel);
        if(flag) {
            //request.setAttribute("msg","增加成功");
            response.sendRedirect(request.getContextPath()+"/cinema/findAll.do");;
        }else {
            request.setAttribute("msg", "增加失败");
            request.getRequestDispatcher("");
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
