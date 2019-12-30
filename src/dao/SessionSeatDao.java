package dao;

import java.util.List;

import bean.SessionBean;
import bean.SessionSeatBean;

public interface SessionSeatDao {
    // Add
    boolean addSessionSeat(long sno, int seatno) throws Exception;
    
    // Delete 
    boolean delSessionSeat(int ssno) throws Exception;
    
    // Update
    boolean updateSessionSeat(int ssno, boolean status) throws Exception;
    
    // Select by session-no
    List<SessionSeatBean> selectBySno(long sno) throws Exception;

    SessionBean fine_one(int ssno) throws Exception;

    /**
     * Select session-seat by ssno
     * @param ssno
     * @return
     * @throws Exception
     */
    SessionSeatBean select(int ssno) throws Exception;

}
