package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SessionBean;
import bean.SessionSeatBean;
import dao.SeatDao;
import dao.SessionSeatDao;
import util.DBUtil;

public class SessionSeatDaoImpl implements SessionSeatDao {
	
	private ResultSet rs=null;

	@Override
	public boolean addSessionSeat(long sno,int seatno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="insert into session_seat (sno,seatno) values (?,?)";
		row=DBUtil.executeUpdate(sql,sno,seatno);
		return (row!=0) ? true:false;
	}

	@Override
	public boolean delSessionSeat(int ssno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="delect * from session_seat where ssno=?";
		row=DBUtil.executeUpdate(sql,ssno);
		return (row!=0) ? true:false;
	}

	@Override
	public boolean updateSessionSeat(int ssno,boolean status) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="update session_seat set status =? where ssno=?";
		row=DBUtil.executeUpdate(sql,status,ssno);
		return (row!=0) ? true:false;
	}

	@Override
	public List<SessionSeatBean> selectBySno(long sno) throws Exception {
		// TODO 自动生成的方法存根
		List<SessionSeatBean> SessionSeat_list = new ArrayList<SessionSeatBean>();
		SeatDao seat_dao = new SeatDaoImpl();
		String sql="select * from session_seat where sno = ?";
		rs=DBUtil.executeQuery(sql, sno);
		while(rs.next()) {
              SessionSeatBean sessionseat=new SessionSeatBean();
              sessionseat.setSsno(rs.getInt("ssno"));
              sessionseat.setStatus(rs.getBoolean("status"));
              sessionseat.setSeat(seat_dao.findBysseat(rs.getInt("ssno")));
              SessionSeat_list.add(sessionseat);
		}
		return SessionSeat_list;
	}
	
	   @Override
	    public SessionBean fine_one(int ssno) throws Exception {
	        // TODO 自动生成的方法存根
	        SessionBean session=new SessionBean();
	        String sql="select * from session where sno=(select * from session_seat where ssno =?)";
	        rs=DBUtil.executeQuery(sql, ssno);
	        while(rs.next()) {
	            
	            session.setSno(rs.getInt("sno"));
	            session.setBegin_time(rs.getDate("begin_time"));
	            session.setEnd_time(rs.getDate("end_time"));
	            session.setPrice(rs.getDouble("price"));

	        }
	        return session;
	    }

    @Override
    public SessionSeatBean select(int ssno) throws Exception {
        SessionSeatBean ssbean = null;
        SeatDao seat_dao = new SeatDaoImpl();
        String sql = "select * from session_seat where ssno = ?";
        rs = DBUtil.executeQuery(sql, ssno);
        while(rs.next()) {
            ssbean = new SessionSeatBean();
            ssbean.setSsno(rs.getInt("ssno"));
            ssbean.setStatus(rs.getBoolean("status"));
            ssbean.setSeat(seat_dao.findBysseat(rs.getInt("ssno")));
        }
        return ssbean;
    }

}
