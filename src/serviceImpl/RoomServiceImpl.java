package serviceImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.FilmBean;
import bean.RoomBean;
import dao.CAdminDao;
import dao.RoomDao;
import daoImpl.CAdminDaoImpl;
import daoImpl.FilmDaoImpl;
import daoImpl.RoomDaoImpl;
import service.RoomService;
import util.DBUtil;

public class RoomServiceImpl implements RoomService {

	@Override
	public RoomBean selectByname(String room) {
		RoomDao room_dao=new RoomDaoImpl();
		RoomBean roombean=null;
		Connection conn=DBUtil.getConn();
		try {
	            // Start transaction
	            conn.setAutoCommit(false);
	            
	            roombean= room_dao.selectByname(room);
	            
	            // complete transaction
	            conn.commit();
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            // error occur
	            try {
	                conn.rollback();
	            } catch (SQLException e1) {
	                // TODO Auto-generated catch block
	                e1.printStackTrace();
	            }
	            e.printStackTrace();
	        } finally {
	            DBUtil.close();
	        }
		return roombean;
		// TODO 自动生成的方法存根

	}

	@Override
	public List<RoomBean> find_all() {
		// TODO 自动生成的方法存根
		List<RoomBean> room_list=new ArrayList<RoomBean>();
		RoomDao room_dao=new RoomDaoImpl();
        try {
           room_list = room_dao.find_all();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        
		return room_list;
	}

    @Override
    public List<RoomBean> findByCadmin(String account) {
        List<RoomBean> room_list = null;
        DBUtil.getConn();
        RoomDao room_dao = new RoomDaoImpl();
        CAdminDao cadmin_dao = new CAdminDaoImpl();
        
        try {
            // 1. get the cinema-no the stored in cadmin table
            int cno = cadmin_dao.select(account).getCinema().getCno();
            // 2. get the room list according cinema-no
            room_list = room_dao.selectByCno(cno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return room_list;
    }

}
