/*
 * 影厅类
 */
package bean;

import java.util.List;

public class RoomBean {
    private int    rno;
    private int    cno;
    private String rname;
    private String rtype;
    
    private List<SeatBean> seat_list;
    
   public RoomBean() {
        super();
        // TODO Auto-generated constructor stub
    }
   
   public RoomBean(List<SeatBean> seat_list) {
        super();
        this.seat_list = seat_list;
    }
    public List<SeatBean> getSeat_list() {
        return seat_list;
    }
    public void setSeat_list(List<SeatBean> seat_list) {
        this.seat_list = seat_list;
    }
    public int getRno() {
        return rno;
    }
    public void setRno(int rno) {
        this.rno = rno;
    }
    public String getRname() {
        return rname;
    }
    public void setRname(String rname) {
        this.rname = rname;
    }
    public String getRtype() {
        return rtype;
    }
    public void setRtype(String rtype) {
        this.rtype = rtype;
    }
    public int getCno() {
        return cno;
    }
    public void setCno(int cno) {
        this.cno = cno;
    }
    
    
    
}
