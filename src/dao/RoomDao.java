package dao;

import java.util.List;

import bean.RoomBean;

public interface RoomDao {
    // Add a new room
    boolean addRoom(String rname, String rtype, int cno) throws Exception;    
    
    // Delete a room
    boolean delRoom(int rno) throws Exception;
    
    // Update
    boolean updateRoom(String rname, String rtype, int rno) throws Exception;
    
    // select one
    RoomBean select(int rno) throws Exception;
    
    // select part by cinema-no
    List<RoomBean> selectByCno(int cno) throws Exception;

    RoomBean selectByname(String rname) throws Exception;

    List<RoomBean> find_all() throws Exception;

}
