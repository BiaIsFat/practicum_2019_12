package dao;

import java.sql.Date;
import java.util.List;

import bean.CinemaBean;
import bean.SessionBean;

public interface SessionDao {
    // Add
    boolean addSession(long sno, String begin_time, String end_time, double price, int cno, int rno, int fno) throws Exception;

    // Delete
    boolean delSession(long sno) throws Exception;
    
    // Update
    boolean updateSession(long sno, String begin_time, String end_time, double price)
            throws Exception;
    
    // select one session
    SessionBean select(long sno) throws Exception;
    
    // select by film no & cinema no
    List<SessionBean> select(int fno, int cno) throws Exception;
    
    // select by cinema no
    List<SessionBean> selectByCno(int cno) throws Exception;


    }
