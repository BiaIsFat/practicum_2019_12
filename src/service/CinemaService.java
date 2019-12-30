package service;


import bean.*;
import java.util.List;


public interface CinemaService {
	
	boolean logoffCinema(int cno);
	
	boolean changeCinema(int cno);//修改影院信息，参数还没写
	
	List<CinemaBean> findAll();//显示所有影院
	
	/**
	 * Find cinemas by keyword
	 * @param keyword
	 * @return List<CinemaBean>
	 */
	List<CinemaBean> findByKeyWord(String keyword);//查找某一个影院
	
	/**
	 * Find cinema by cno
	 * @param cno
	 * @return CinemaBean
	 */
	CinemaBean findOne(int cno);

	   /**
     *  根据电影编号、影院编号搜索场次
     * @param fno
     * @param cno
     * @return
     */
    List<SessionBean> findSession(int fno, int cno);
    
    List<SessionBean> findSession(int cno);
    
    boolean planSessionInfo(SessionBean session);

    // Search cinemas that have planed session that choosen
    List<CinemaBean> findByFilm(int fno);

    boolean addCinema(String cname, String worktime, String addr, String tel);
}
