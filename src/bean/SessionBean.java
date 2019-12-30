/*
 * 场次类
 */
package bean;

import java.util.List;
import java.util.Date;


public class SessionBean {
    private long    sno;
    private Date   begin_time;
    private Date   end_time;
    private double price;
    
    private RoomBean room;
    private FilmBean film;
    private CinemaBean cinema;
    private List<OrderBean> order_list;
    private List<SessionSeatBean> session_seat_list;
    
    public List<OrderBean> getOrder_list() {
        return order_list;
    }
    public void setOrder_list(List<OrderBean> order_list) {
        this.order_list = order_list;
    }
    public List<SessionSeatBean> getSession_seat_list() {
        return session_seat_list;
    }
    public void setSession_seat_list(List<SessionSeatBean> session_seat_list) {
        this.session_seat_list = session_seat_list;
    }
    public long getSno() {
        return sno;
    }
    public void setSno(long sno) {
        this.sno = sno;
    }
    public Date getBegin_time() {
        return begin_time;
    }
    public void setBegin_time(Date begin_time) {
        this.begin_time = begin_time;
    }
    public Date getEnd_time() {
        return end_time;
    }
    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public RoomBean getRoom() {
        return room;
    }

    public void setRoom(RoomBean room) {
        this.room = room;
    }

    public FilmBean getFilm() {
        return film;
    }

    public void setFilm(FilmBean film) {
        this.film = film;
    }
    public CinemaBean getCinema() {
        return cinema;
    }
    public void setCinema(CinemaBean cinema) {
        this.cinema = cinema;
    }
    
}
