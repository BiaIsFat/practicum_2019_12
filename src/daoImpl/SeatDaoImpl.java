package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SeatBean;
import dao.SeatDao;
import util.DBUtil;

public class SeatDaoImpl implements SeatDao {
	
	private ResultSet rs=null;

	@Override
	public boolean addSeat(String seatname) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="insert into seat (seatname) values(?)";
		row=DBUtil.executeUpdate(sql, seatname);
		return (row!=0)?true:false;
	}

	@Override
	public boolean delSeat(int seatno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="delect * from seat where seatno=?";
		row=DBUtil.executeUpdate(sql, seatno);
		return (row!=0)?true:false;
	}

	@Override
	public boolean updateSeat(String seatname,int seatno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="update seat set seatname = ? where seatno = ?";
		row=DBUtil.executeUpdate(sql,seatname,seatno);
		return (row!=0)?true:false;

	}

	@Override
	public List<SeatBean> select(int rno) throws Exception {
		// TODO 自动生成的方法存根
		List<SeatBean> seat_list =new ArrayList<SeatBean>();
		String sql="select * from seat where rno = ?";
		rs=DBUtil.executeQuery(sql, rno);
		while(rs.next()) {
			SeatBean seat=new SeatBean();
			seat.setSeatno(rs.getInt("seatno"));
			seat.setSeatname(rs.getString("seatname"));
			seat_list.add(seat);
		}
		
		return seat_list;
	}

    @Override
    public SeatBean findBysseat(int ssno) throws Exception {
        SeatBean seat=new SeatBean();
        String sql="select * from seat where seatno =(select seatno from session_seat where ssno = ?)";
        rs=DBUtil.executeQuery(sql, ssno);
        while(rs.next()) {
            seat.setSeatno(rs.getInt("seatno"));
            seat.setSeatname(rs.getString("seatname"));
        }
        return seat;
    }

}
