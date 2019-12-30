package dao;

import java.util.List;

import bean.CinemaBean;

public interface CinemaDao {
    // Select a cinema
    CinemaBean select(int cno) throws Exception;
    
    // Select all cinema
    List<CinemaBean> select() throws Exception;
    
    // Add a cinema
    public boolean AddCinema(String cname, String addr, String worktime, 
            String tel) throws Exception;
    
    // Update information
    boolean updateCinema(int cno, String cname, String addr, String worktime, String tel) throws Exception;
    
    // Delete a cinema
    boolean delCinema(int cno) throws Exception;

    // Select cinemas by fno
    List<CinemaBean> selectByFno(int fno) throws Exception;

    List<CinemaBean> selectByKeyword(String keyword) throws Exception;

    
}
