package bean;

public class TicketItemBean {

	private int    tino;
	private double tiprice;
	
	private SessionSeatBean session_seat;

    public int getTino() {
        return tino;
    }

    public void setTino(int tino) {
        this.tino = tino;
    }

    public double getTiprice() {
        return tiprice;
    }

    public void setTiprice(double tiprice) {
        this.tiprice = tiprice;
    }

    public SessionSeatBean getSession_seat() {
        return session_seat;
    }

    public void setSession_seat(SessionSeatBean session_seat) {
        this.session_seat = session_seat;
    }
	
	
}
