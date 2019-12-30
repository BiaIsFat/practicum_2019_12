package service;

import bean.*;
import java.util.List;

public interface SessionSeatService {
	
	List<SessionSeatBean> findAll();
	
	SessionSeatBean findOne(int ssno);

    SeatBean findseat_one(int ssno);

    SessionBean findsession_one(long sno);

    boolean change(int ssno, boolean status);
    
    /**
     * Find all seats by session 
     * @param sno
     * @return
     */
    List<SessionSeatBean> findSeatsBySno(long sno);

    /**
     * Find seats that user has choosen
     * @param ssno_array
     * @return
     */
    List<SessionSeatBean> findSeats(int[] ssno_array);

    List<SessionBean> findSessionsByCadmin(String account);

    boolean planSessionSeatInfo(String begin_time, double price, int rno, int fno, String account);
    
    boolean updateSession(int sno, String begin_time, double price);
	
}
