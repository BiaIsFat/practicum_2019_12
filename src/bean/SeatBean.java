package bean;

import java.util.List;

public class SeatBean {
    private int    seatno;
    private String seatname;
    
    private List<SessionSeatBean> session_seat_list;
    
    
    public List<SessionSeatBean> getSession_seat_list() {
        return session_seat_list;
    }
    public void setSession_seat_list(List<SessionSeatBean> session_seat_list) {
        this.session_seat_list = session_seat_list;
    }
    public int getSeatno() {
        return seatno;
    }
    public void setSeatno(int seatno) {
        this.seatno = seatno;
    }
    public String getSeatname() {
        return seatname;
    }
    public void setSeatname(String seatname) {
        this.seatname = seatname;
    }
    
    
}
