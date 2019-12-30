package daoImpl;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SessionBean;
import dao.SessionDao;
import util.DBUtil;

public class SessionDaoImpl implements SessionDao {
	
	private ResultSet rs=null;

	@Override
	public boolean addSession(long sno, String begin_time,String end_time,double price,int  cno,int rno,int fno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="insert into session (sno, begin_time,end_time,price,cno,rno,fno) values(?,?,?,?,?,?,?)";
		row=DBUtil.executeUpdate(sql, sno, begin_time,end_time,price,cno,rno,fno);
		return (row!=0)? true:false;
	
	}

	@Override
	public boolean delSession(long sno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="delect * from where sno = ?";
		row=DBUtil.executeUpdate(sql,sno);
		return (row!=0)? true:false;
	}

	@Override
	public boolean updateSession(long sno,String begin_time,String end_time,double price) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="update session set begin_time = ?,end_time=?,price=? where sno=?";
		row=DBUtil.executeUpdate(sql, begin_time,end_time,price,sno);
		return (row!=0)? true:false;

	}

	@Override
	public SessionBean select(long sno) throws Exception {
		// TODO 自动生成的方法存根
		SessionBean session=null;
		String sql="select * from session where sno= ? order by begin_time desc";
		rs=DBUtil.executeQuery(sql, sno);
		while(rs.next()){
			session=new SessionBean();
			session.setSno(rs.getLong("sno"));
			session.setBegin_time(rs.getTimestamp("begin_time"));
			session.setEnd_time(rs.getTimestamp("end_time"));
			session.setPrice(rs.getDouble("price"));
			session.setFilm(new FilmDaoImpl().select(rs.getInt("fno")));
			session.setRoom(new RoomDaoImpl().select(rs.getInt("rno")));
			session.setCinema(new CinemaDaoImpl().select(rs.getInt("cno")));
		}
		return session;
	}

	@Override
	public List<SessionBean> select(int fno, int cno) throws Exception {
		// TODO 自动生成的方法存根
	    List<SessionBean> session_list = new ArrayList<SessionBean>();
		String sql="select * from session where fno = ? and cno = ? order by begin_time desc";
		rs=DBUtil.executeQuery(sql, fno,cno);
		while(rs.next()) {
		    SessionBean session=new SessionBean();
			session.setSno(rs.getLong("sno"));
			session.setBegin_time(rs.getTimestamp("begin_time"));
			session.setEnd_time(rs.getTimestamp("end_time"));
			session.setPrice(rs.getDouble("price"));
			session.setFilm(new FilmDaoImpl().select(fno));
			session.setCinema(new CinemaDaoImpl().select(rs.getInt("cno")));
			session_list.add(session);
		}
		return session_list;
	}

    @Override
    public List<SessionBean> selectByCno(int cno) throws Exception {
     // TODO 自动生成的方法存根
        List<SessionBean> session_list = new ArrayList<SessionBean>();
        String sql="select * from session where cno = ? order by begin_time desc";
        rs=DBUtil.executeQuery(sql, cno);
        while(rs.next()) {
            SessionBean session=new SessionBean();
            session.setSno(rs.getLong("sno"));
            session.setBegin_time(rs.getTimestamp("begin_time"));
            session.setEnd_time(rs.getTimestamp("end_time"));
            session.setPrice(rs.getDouble("price"));
            session.setFilm(new FilmDaoImpl().select(rs.getInt("fno")));
            session.setRoom(new RoomDaoImpl().select(rs.getInt("rno")));
            session.setCinema(new CinemaDaoImpl().select(rs.getInt("cno")));
            session_list.add(session);
        }
        return session_list;
    }
}
