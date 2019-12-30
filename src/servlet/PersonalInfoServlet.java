//PersonalInfoServlet.java
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

import bean.CAdminBean;
import bean.CommentBean;
import bean.PAdminBean;
import bean.UserBean;
import service.OrderService;
import service.PersonalInfoService;
import serviceImpl.OrderServiceImpl;
import serviceImpl.PersonalInfoServiceImpl;

/**
 * Servlet implementation class PersonalInfoServlet
 */
@WebServlet("/personal/*")
public class PersonalInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalInfoServlet() {
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
        int head_length = (request.getContextPath()+request.getServletPath()).length()+1;
        String method_name = path.substring(head_length, path.indexOf(".do"));
        System.out.println(this.getClass().getName() + " : " + method_name + "\n");
        
        try {
            Method method = getClass().getDeclaredMethod(method_name,
                    HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	// According user's identify to log in
	// 0: Normal user; 1: Cinema-Administrator; 2: Platform-Administrator
	protected void goLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String identify = request.getParameter("identify");
	    System.out.println(identify.getClass().getName() + " : " + identify + ": identify" + "\n");
	    if(identify.equals("0")) {
	        request.getRequestDispatcher("/personal/login.do").forward(request, response);
	        return;
	    } else if (identify.equals("1")) {
	        request.getRequestDispatcher("/personal/cadmin_login.do").forward(request, response);
            return;
	    } else {
	        request.getRequestDispatcher("/personal/padmin_login.do").forward(request, response);
            return;
	    }
	}
	
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String pwd = request.getParameter("upwd");
        System.out.println(uname + " / " + pwd);

        // 0:wrong password ; -1:invalid username ; greater then 0:user's uid
        int flag=0;
        PersonalInfoService person = new PersonalInfoServiceImpl();
        flag = person.login(uname, pwd);
        if(flag == -1) {
            request.setAttribute("msg", "invalid username!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else if(flag == 0) {
            request.setAttribute("msg", "wrong password!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("uid", flag);
            request.getSession().setAttribute("uname", uname);
            request.getRequestDispatcher("/personal/findInfo.do").forward(request, response);
        }
    }
    
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
    
    protected void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
        String uphone = request.getParameter("uphone");
        String email = request.getParameter("email");
        String sex = request.getParameter("sex");
        
        PersonalInfoService person = new PersonalInfoServiceImpl();
        boolean flag = false;
        flag = person.signUp(uname, upwd, uphone, email, sex);
        
        if(flag) {
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        } else {
            response.sendRedirect(request.getContextPath()+"/register.jsp");
        }
    }
    
    protected void beVip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int uid = (int)session.getAttribute("uid");
        
        PersonalInfoService personal_service = new PersonalInfoServiceImpl();
        boolean flag = personal_service.beVip(uid);
        
        if(flag) {
            response.sendRedirect(request.getContextPath()+"");
        } else {
            request.setAttribute("msg", "failed");
            request.getRequestDispatcher("").forward(request, response);
        }
    }
    
  //查询个人信息
    protected void findInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int uid =(int) request.getSession().getAttribute("uid");
        PersonalInfoService userinfo= new PersonalInfoServiceImpl();
        UserBean user = userinfo.findinfoBySelf(uid);
        request.setAttribute("user",user);
        
        // According different 
        String target = request.getParameter("target");
        if(target != null && target.equals("modifyPersonal")) {
            request.getRequestDispatcher("/modifyPersonal.jsp").forward(request, response);
        } else if(request.getParameter("vip")!=null){
            request.getRequestDispatcher("/vip.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/user_info.jsp").forward(request, response);
        }
        
    }
    
    //更新个人信息
    protected void updateInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int uid =(int) request.getSession().getAttribute("uid");
        PersonalInfoService userinfo=new PersonalInfoServiceImpl();
        //UserBean userbean=userinfo.findinfoBySelf(uid);
        String sex = request.getParameter("sex");
        //String uname=request.getParameter("uname");
        String upwd=request.getParameter("newpass");
        String email=request.getParameter("email");
        String uphone=request.getParameter("uphone");
        boolean flag=false;
        flag=userinfo.changeInfo(uid, upwd, uphone, sex, email);       
        if(flag) {
            response.sendRedirect(request.getContextPath()+"/personal/findInfo.do");
        } else {
            
            request.setAttribute("msg","修改失败！");
            request.getRequestDispatcher("/use_infro.jsp");
        }
    }
    
  //成为会员
    protected void updatevip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid=(int)request.getSession().getAttribute("uid");
         PersonalInfoService uservip=new PersonalInfoServiceImpl();
        // uservip.beVip(uid, true);

        // UserBean userbeanvip=uservip.findinfoBySelf(uid);
       
        // boolean vip=userbeanvip.isVip();
         boolean flag=false;
         flag=uservip.beVip(uid);
                
         if(flag) {
             response.sendRedirect(request.getContextPath()+"/use_vip.jsp");
         } else {
             
             request.setAttribute("msg","改签失败！");
             request.getRequestDispatcher("/use_vip.jsp");
         }
     }           
    //查看订单
    protected void find_order(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int uid=(int) request.getSession().getAttribute("uid");
        PersonalInfoService userorder=new PersonalInfoServiceImpl();
        userorder.findorderByself(uid);
        request.setAttribute("userorder",userorder);
        request.getRequestDispatcher("/order.jsp");      
        
    }
    //更改订单
    protected void update_orderstatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String ono=(String) request.getSession().getAttribute("ono");
        
        OrderService  order=new OrderServiceImpl();
        
        boolean flag = false;
        
        
        flag=order.changeTicket(ono);
        
         if(flag) {
             response.sendRedirect(request.getContextPath()+"/order.jsp");
         } else {
             
             request.setAttribute("msg","改签失败！");
             request.getRequestDispatcher("/order.jsp");
         }
        
    }
    
    protected void cadmin_login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("uname");
        String pwd = request.getParameter("upwd");
        System.out.println(account+"/"+pwd);
        
        // 0:wrong password ; -1:invalid username ; greater then 0:user's uid
        int flag=0;
        PersonalInfoService person = new PersonalInfoServiceImpl();
        flag = person.cadmin_login(account, pwd);
        System.out.println(flag);
        if(flag == -1) {
            request.setAttribute("msg", "invalid username!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else if(flag == 0) {
            request.setAttribute("msg", "wrong password!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("uid", flag);
            request.getSession().setAttribute("account", account);
            response.sendRedirect(request.getContextPath()+"/personal/find_cadmin.do");
        }
     }
   protected void find_cadmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
         String account=(String)request.getSession().getAttribute("account");
         PersonalInfoService cadmin=new PersonalInfoServiceImpl();
         CAdminBean cadminbean= cadmin.find_cadmin(account);
         request.setAttribute("cadmin",cadminbean);
         request.getRequestDispatcher("/cadminfo.jsp").forward(request, response);      
     }
   
protected void addcomment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
       int uid=(int)request.getSession().getAttribute("uid");
       int replyno;
       if(request.getParameter("replyno") != null) {
           replyno=Integer.valueOf(request.getParameter("replyno"));
       } else {
           // If user did not reply any body, 1 is the top comment of all
           replyno = 1;
       }
       String content=request.getParameter("content");
       int fno=Integer.valueOf(request.getParameter("fno"));
       System.out.println(uid+"/"+replyno+"/"+content+"/"+fno+"\n");
       
       PersonalInfoService comment=new PersonalInfoServiceImpl();
       boolean flag=false;
       flag=comment.comment(content, uid,replyno,fno);
       
       System.out.println("addcomment:"+flag);
       if(flag) {
           request.setAttribute("msg","评论成功");
           response.sendRedirect(request.getContextPath()+"/film/find_one.do?fno="+fno);
       }else {
           request.setAttribute("msg","评论失败");
           response.sendRedirect(request.getContextPath()+"/film/find_one.do?fno="+fno);
       }
   }

   protected void findcomment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //int uid=(int)request.getSession().getAttribute("uid");
       int fno = (int)request.getAttribute("fno");
       List<CommentBean> commentbean=null;
       PersonalInfoService comment=new PersonalInfoServiceImpl();
       // commentbean=comment.findCommentByself(uid);
       commentbean = comment.findCommentByFilm(fno);
       request.setAttribute("comment_list",commentbean);
       request.getRequestDispatcher("/filmDetail.jsp").forward(request, response);
   }
   
   protected void delcomment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int cno =(int)request.getAttribute("cno");
       PersonalInfoService comment=new PersonalInfoServiceImpl();
       boolean flag= comment.delcomment(cno);
      if(flag) {
          request.setAttribute("msg","删除成功");
          response.sendRedirect(request.getContextPath()+"/comment.jsp");
      }else {
          request.setAttribute("msg","删除失败");
          response.sendRedirect(request.getContextPath()+"/comment.jsp");
      }
   }
   
   protected void padmin_login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
       String account = request.getParameter("uname");
       String pwd = request.getParameter("upwd");
       
       // 0:wrong password ; -1:invalid username ; greater then 0:user's uid
       int flag=0;
       PersonalInfoService person = new PersonalInfoServiceImpl();
       flag = person.padmin_login(account, pwd);
       if(flag == -1) {
           request.setAttribute("msg", "invalid username!");
           request.getRequestDispatcher("/login.jsp").forward(request, response);
       } else if(flag == 0) {
           request.setAttribute("msg", "wrong password!");
           request.getRequestDispatcher("/login.jsp").forward(request, response);
       } else {
           request.getSession().setAttribute("account", account);
           response.sendRedirect(request.getContextPath()+"/personal/find_padmin.do");
       }
   }
   protected void find_padmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String account=(String)request.getSession().getAttribute("account");
       PersonalInfoService padmin=new PersonalInfoServiceImpl();
       PAdminBean padminbean= padmin.find_padmin(account);
       request.setAttribute("padmin",padminbean);
       request.getRequestDispatcher("/padminfo.jsp").forward(request, response);    
   }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
