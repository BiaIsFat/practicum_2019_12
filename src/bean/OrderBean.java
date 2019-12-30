package bean;

import java.util.Date;
import java.util.List;

public class OrderBean {

	private String     ono;
	private Date    otime;
	private double  total;
	private double  grade;
	private boolean status;
	
	private UserBean user;
	private SessionBean session;
	private List<OtherItemBean> other_item_list; 
	private List<TicketItemBean> ticket_item_list;
	
	public UserBean getUser() {
        return user;
    }
    public void setUser(UserBean user) {
        this.user = user;
    }
    public List<OtherItemBean> getOther_item_list() {
        return other_item_list;
    }
    public void setOther_item_list(List<OtherItemBean> other_item_list) {
        this.other_item_list = other_item_list;
    }
    public List<TicketItemBean> getTicket_item_list() {
        return ticket_item_list;
    }
    public void setTicket_item_list(List<TicketItemBean> ticket_item_list) {
        this.ticket_item_list = ticket_item_list;
    }
    public SessionBean getSession() {
        return session;
    }
    public void setSession(SessionBean session) {
        this.session = session;
    }
    public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public Date getOtime() {
		return otime;
	}
	public void setOtime(Date otime) {
		this.otime = otime;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}

	
}
