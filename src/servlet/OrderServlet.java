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

import bean.OrderBean;
import service.OrderService;
import service.PersonalInfoService;
import serviceImpl.OrderServiceImpl;
import serviceImpl.PersonalInfoServiceImpl;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order/*")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	    request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	    // 获取部分URL：/example/film/one.do
	    String path = request.getRequestURI();
	    // 获取方法前部分长度：/example/film/
	    int head_length = (request.getContextPath()+request.getServletPath()).length()+1;
	    String method_name = path.substring(head_length, path.indexOf(".do"));
	    try {
            Method method = getClass().getDeclaredMethod(method_name,
                    HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	//插入订单和订单细则 12.24
	protected void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    // Total price
		double total=Double.valueOf(request.getParameter("total"));
		// Get film_no
		int fno = Integer.valueOf(request.getParameter("fno"));
		// Get user_id
		int uid =(int)session.getAttribute("uid");
		// Get session_no
	    long sno =Long.valueOf(request.getParameter("sno"));
	    // Get session_seat_no
	    String[] ssno_str = request.getParameterValues("ssno");
	    int[] ssno_arr = new int[ssno_str.length];
	    for(int i=0; i<ssno_str.length; i++) {
	        ssno_arr[i] = Integer.valueOf(ssno_str[i]);
	    }

		
	    boolean flag_order=false;
		OrderService order_service=new OrderServiceImpl();
		
		flag_order=order_service.takeOrder(total,uid,sno,fno,ssno_arr);
		
		if(flag_order) {
		    /*
		     *  Take order success
		     *  redirect to the user's order page
		     *  show all the orders of logged in user
		     */
		    response.sendRedirect(request.getContextPath()+"/order/find_order.do");
		} else {
		    /*
		     *  Take order fail
		     *  redirect to the seat choosing page
		     */
		    response.sendRedirect(request.getContextPath()+"/sessionseat/findSeats.do?sno="+sno);
		}
	
	}

	//查看订单
    protected void find_order(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	int uid=(int) request.getSession().getAttribute("uid");
        PersonalInfoService userorder=new PersonalInfoServiceImpl();
        List<OrderBean> order_list = userorder.findorderByself(uid);
        request.setAttribute("order_list",order_list);
        request.getRequestDispatcher("/ticketitem.jsp").forward(request, response);;      
        
    }
    //更改订单
    protected void update_orderstatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String ono=(String)request.getSession().getAttribute("ono");
    	
    	OrderService  order=new OrderServiceImpl();
    	
    	boolean flag = false;
    	
        
    	flag=order.changeTicket(ono);
    	
    	 if(flag) {
             response.sendRedirect("/order.jsp");
         } else {
        	 
        	 request.setAttribute("msg","改签失败！");
             request.getRequestDispatcher("/order.jsp");
         }
    	
    }
    
    protected void grade(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ono = request.getParameter("ono");
        double grades = Double.valueOf(request.getParameter("grades"));
        
        OrderService order_service = new OrderServiceImpl();
        boolean flag = false;
        flag = order_service.setGrades(grades, ono);
        
        response.sendRedirect(request.getContextPath()+"/order/find_order.do");
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
