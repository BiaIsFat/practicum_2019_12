package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.RoomBean;
import dao.RoomDao;
import util.DBUtil;

public class RoomDaoImpl implements RoomDao {
    private ResultSet rs = null;
    @Override
    public boolean addRoom(String rname, String rtype, int cno) throws Exception {
        int row = 0;
        String sql = "insert into room(rname, rtype, cno) values(?,?,?)";
        row = DBUtil.executeUpdate(sql, rname, rtype, cno);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean delRoom(int rno) throws Exception {
        int row = 0;
        String sql = "delete from room where rno = ?";
        row = DBUtil.executeUpdate(sql, rno);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean updateRoom(String rname, String rtype, int rno) throws Exception {
        int row = 0;
        String sql = "update room set rname=?, rtype=? where rno=?";
        row = DBUtil.executeUpdate(sql, rname, rtype, rno);
        return (row!=0) ? true : false;
    }

    @Override
    public RoomBean select(int rno) throws Exception {
        RoomBean room = null;
        String sql = "select * from room where rno = ?";
        rs = DBUtil.executeQuery(sql, rno);
        while(rs.next()) {
            room = new RoomBean();
            room.setRno(rs.getInt("rno"));;
            room.setRname(rs.getString("rname"));
            room.setRtype(rs.getString("rtype"));
            room.setCno(rs.getInt("cno"));
            
        }
        return room;
    }

    @Override
    public List<RoomBean> selectByCno(int cno) throws Exception {
        List<RoomBean> room_list = new ArrayList<RoomBean>();
        String sql = "select * from room where cno = ?";
        rs = DBUtil.executeQuery(sql, cno);
        while(rs.next()) {
            RoomBean room = new RoomBean();
            room.setRno(rs.getInt("rno"));;
            room.setRname(rs.getString("rname"));
            room.setRtype(rs.getString("rtype"));
            room_list.add(room);
        }
        return room_list;
    }
    
    @Override
    public RoomBean selectByname(String rname) throws Exception {
        RoomBean room = null;
        String sql = "select * from room where rname = ?";
        rs = DBUtil.executeQuery(sql, rname);
        while(rs.next()) {
            room = new RoomBean();
            room.setRno(rs.getInt("rno"));;
            room.setRname(rs.getString("rname"));
            room.setRtype(rs.getString("type"));
        }
        return room;
    }
    
    //12.24
    @Override
    public List<RoomBean> find_all() throws Exception {
        List<RoomBean> room_list = new ArrayList<RoomBean>();
        String sql = "select * from room ";
        rs = DBUtil.executeQuery(sql);
        while(rs.next()) {
            RoomBean room = new RoomBean();
            room.setRno(rs.getInt("rno"));;
            room.setRname(rs.getString("rname"));
            room.setRtype(rs.getString("type"));
            room_list.add(room);
        }
        return room_list;
    }

}
