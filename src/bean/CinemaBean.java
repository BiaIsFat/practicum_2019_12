package bean;

import java.util.List;

public class CinemaBean {
    private int    cno;
    private String cname;
    private String addr;
    private String worktime;
    private String tel;
    
    private List<RoomBean> room_list;
    
    public CinemaBean() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public CinemaBean(List<RoomBean> room_list) {
        this();
        this.room_list = room_list;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public List<RoomBean> getRoom_list() {
        return room_list;
    }



    public void setRoom_list(List<RoomBean> room_list) {
        this.room_list = room_list;
    }



    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getWorktime() {
        return worktime;
    }

    public void setWorktime(String worktime) {
        this.worktime = worktime;
    }
    
    
}
