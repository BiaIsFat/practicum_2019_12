package bean;

public class SessionSeatBean {
	private int     ssno;
	private boolean status;
	
	private SeatBean    seat;
	private SessionBean session;

	public SessionBean getSession() {
        return session;
    }
    public void setSession(SessionBean session) {
        this.session = session;
    }
    public SeatBean getSeat() {
        return seat;
    }
    public void setSeat(SeatBean seat) {
        this.seat = seat;
    }
	
	
	public int getSsno() {
		return ssno;
	}
	public void setSsno(int ssno) {
		this.ssno = ssno;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
}