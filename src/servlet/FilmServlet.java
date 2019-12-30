package servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.FileItem;

import bean.FilmBean;
import service.FilmService;
import serviceImpl.FilmServiceImpl;

/**
 * Servlet implementation class FilmServlet
 */
@WebServlet("/film/*")
public class FilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilmServlet() {
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
	    try {
            Method method = getClass().getDeclaredMethod(method_name,
                    HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	// Search by keyword, null keyword also ar
	protected void keySearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取关键字
        String keyword = request.getParameter("keyword");
        String account = (String)request.getSession().getAttribute("account");
        // 调用service，处理业务流程
        FilmService film_service = new FilmServiceImpl();
        List<FilmBean> film_list = film_service.findByKeyword(keyword);
        
        // 将业务处理结果推送至浏览器
        request.setAttribute("film_list", film_list);
        
        // If the list is used in session arrangement
        // Dispatch to the web page for administrator
        // To choose
        if(request.getAttribute("arrange")!=null && (boolean)request.getAttribute("arrange") == true) {
            request.getRequestDispatcher("/selectsee.jsp").forward(request, response);
        } else if (request.getSession().getAttribute("uid")==null && request.getSession().getAttribute("account")!=null){
            request.getRequestDispatcher("/downfilm.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/searchFilm.jsp").forward(request, response);
        }
    }
	
	protected void find_one(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int fno = Integer.valueOf(request.getParameter("fno"));
        
        FilmService film_service = new FilmServiceImpl();
        FilmBean film = film_service.findOne(fno);
        String account=request.getParameter("account");
        request.setAttribute("fno", film.getFno());
        request.setAttribute("film", film);
        if(account!=null){
            request.getRequestDispatcher("/updatefilm.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/personal/findcomment.do").forward(request, response);
    }
	
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    FilmService film_service = new FilmServiceImpl();
	    List<FilmBean> film_list = film_service.findAll();
	    
	    request.setAttribute("film_list", film_list);
	    request.getRequestDispatcher("/cinema/index.do").forward(request, response);
	}
	

	// 增加电影
    protected void addFilm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int duration = Integer.valueOf(request.getParameter("duration"));
        String dobMonth = request.getParameter("dobMonth");
        String dobDay = request.getParameter("dobDay");
        String dobYear = request.getParameter("dobYear");
        String otime = dobYear + dobMonth + dobDay;
        String fname = request.getParameter("fname");
        String intro = request.getParameter("intro");
        String type = request.getParameter("type");
        String actor = request.getParameter("actor");
        String pic = request.getParameter("pic");
        String country = request.getParameter("country");
        String view = request.getParameter("view");
        FilmService film_add = new FilmServiceImpl();
        boolean flag = false;
        flag = film_add.upFilm(fname, otime, actor, intro, type, pic, country, duration, view);
        if (flag) {
            request.setAttribute("msg", "上架成功");
        } else {
            request.setAttribute("msg", "上架失败");
        }
        System.out.println(flag);
        request.getRequestDispatcher("/padminfo.jsp").forward(request, response);


    }
    
  //下架电影
    protected void downFilm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int fno = Integer.valueOf(request.getParameter("fno"));
         FilmService film_down=new FilmServiceImpl();
         boolean flag=false;
         flag=film_down.downFilm(fno);
         if(flag) {
             request.setAttribute("msg", "下架成功");
         }else {
             request.setAttribute("msg", "下架失败");
         }
         request.getRequestDispatcher("/padminfo.jsp").forward(request, response);
    }
    
  //更改电影
    protected void updateFilm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int  fno=Integer.valueOf(request.getParameter("fno"));
        int  duration = Integer.valueOf(request.getParameter("duration"));
        String dobMonth=request.getParameter("dobMonth");
        String dobDay=request.getParameter("dobDay");
        String dobYear=request.getParameter("dobYear");
        String  otime =dobYear+dobMonth+dobDay;
        String  fname = request.getParameter("fname");
        String  intro = request.getParameter("intro");
        String  type = request.getParameter("type");
        String  actor = request.getParameter("actor");
        String  pic = request.getParameter("pic");
        String  country = request.getParameter("country");
        String  view = request.getParameter("view");
        boolean forbidden=false;
        FilmService film_update = new FilmServiceImpl();
        boolean flag=false;
        flag=film_update.changeFilmInfo(fno,fname, otime, actor, intro, type, pic, country, duration, view,forbidden);
        if(flag) {
            request.setAttribute("msg","上架成功");
        }else {
            request.setAttribute("msg","上架失败");
        }
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
