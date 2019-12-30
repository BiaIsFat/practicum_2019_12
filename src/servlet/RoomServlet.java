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

import bean.RoomBean;
import service.RoomService;
import serviceImpl.RoomServiceImpl;

/**
 * Servlet implementation class RoomServlet
 */
@WebServlet("/room/*")
public class RoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	
	protected void findByCadmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<RoomBean> room_list = null;
	    HttpSession session = request.getSession();
	    RoomService room_service = new RoomServiceImpl();
	    String account = (String)session.getAttribute("account");
	    
	    room_list = room_service.findByCadmin(account);
	    
	    // Dispatch to film-servlet to search all films
	    // First step of arrange session
	    request.setAttribute("arrange", true);
	    request.setAttribute("room_list", room_list);
	    request.getRequestDispatcher("/sessionseat/findSession.do").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
