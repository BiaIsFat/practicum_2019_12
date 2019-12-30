package dao;

import java.util.List;

import bean.SeatBean;

public interface SeatDao {
    // Add a seat
    boolean addSeat(String seatname) throws Exception;
    
    // Delete a seat
    boolean delSeat(int seatno) throws Exception;
    
    // Update
    boolean updateSeat(String seatname, int seatno) throws Exception;
    
    // select seats by room no
    List<SeatBean> select(int rno) throws Exception;

    public SeatBean findBysseat(int ssno) throws Exception;


}
