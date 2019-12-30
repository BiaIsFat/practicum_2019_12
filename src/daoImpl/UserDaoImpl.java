// UserDaoImpl.java
package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.UserBean;
import dao.UserDao;
import util.DBUtil;

public class UserDaoImpl implements UserDao {
    
    private ResultSet rs;

    @Override
    public boolean addUser(String uname, String upwd, String uphone, String email, String sex) throws Exception {
        int row = 0;
        String sql = "insert into user(uname,upwd,phone,email,sex) values(?,?,?,?,?)";
        row = DBUtil.executeUpdate(sql, uname, upwd, uphone, email, sex);
        if(row!=0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean delUser(int uid) throws Exception {
        int row = 0;
        String sql = "delete from user where uid = ?";
        row = DBUtil.executeUpdate(sql, uid);
        
        return (row!=0 ? true : false);
    }

    @Override
    public boolean updateUser(int uid, String upwd, String phone, String email, String sex, 
            boolean vip, boolean forbidden, boolean nospeak) throws Exception {
        
        int row = 0;
        String sql = "update user "
                + "set upwd=?,phone=?,email=?,sex=?,vip=?,forbidden=?,nospeak=? "
                + "where uid=?";
        row = DBUtil.executeUpdate(sql, upwd, phone, email, sex, vip, forbidden, nospeak, uid);
        
        return (row!=0 ? true : false);
    }
    
    @Override
    public boolean updatevip(int uid,boolean vip) throws Exception {  
        int row = 0;
        String sql = "update user set vip =? where uid=?";
        row = DBUtil.executeUpdate(sql,  vip, uid);        
        return (row!=0 ? true : false);
    }

    @Override
    public UserBean select(String uname) throws Exception {
        UserBean user = null;
        String sql = "select * from user where uname = ?";
        rs = DBUtil.executeQuery(sql, uname);
        while(rs.next()) {
            user = new UserBean();
            user.setUid(rs.getInt("uid"));
            user.setEmail(rs.getString("email"));
            user.setForbidden(rs.getBoolean("forbidden"));
            user.setNospeak(rs.getBoolean("nospeak"));
            user.setSex(rs.getString("sex"));
            user.setUname(rs.getString("uname"));
            user.setUphone(rs.getString("phone"));
            user.setUpwd(rs.getString("upwd"));
            user.setVip(rs.getBoolean("vip"));
        }
        return user;
    }

    @Override
    public List<UserBean> selectAll() throws Exception {
        List<UserBean> user_list = new ArrayList<UserBean>();
        String sql = "select * from user";
        rs = DBUtil.executeQuery(sql);
        while(rs.next()) {
            UserBean user = new UserBean();
            user.setUid(rs.getInt("uid"));
            user.setUname(rs.getString("uname"));
            user.setUpwd(rs.getString("upwd"));
            user.setUphone(rs.getString("phone"));
            user.setEmail(rs.getString("email"));
            user.setSex(rs.getString("sex"));
            user.setVip(rs.getBoolean("vip"));
            user.setForbidden(rs.getBoolean("forbidden"));
            user.setNospeak(rs.getBoolean("nospeak"));
            user_list.add(user);
        }
        return user_list;
    }

    @Override
    public UserBean select(int uid) throws Exception {
        UserBean user=null;
        String sql="select * from user where uid=?";
        rs=DBUtil.executeQuery(sql, uid);
        while(rs.next()) {
            user = new UserBean();
            user.setUid(rs.getInt("uid"));
            user.setUname(rs.getString("uname"));
            user.setUpwd(rs.getString("upwd"));
            user.setUphone(rs.getString("phone"));
            user.setEmail(rs.getString("email"));
            user.setSex(rs.getString("sex"));
            user.setVip(rs.getBoolean("vip"));
            user.setForbidden(rs.getBoolean("forbidden"));
            user.setNospeak(rs.getBoolean("nospeak"));
            
        }
        return user;
    }

}












