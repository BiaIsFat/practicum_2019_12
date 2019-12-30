// UserDao.java
package dao;

import java.util.List;

import bean.UserBean;

public interface UserDao {
    // Add
    boolean addUser(String uname, String upwd, String uphone, String email, String sex) throws Exception;
    
    // Delete
    boolean delUser(int uid) throws Exception;
    
    // Update
    boolean updateUser(int uid, String upwd, String phone, String email, String sex, boolean vip, boolean forbidden,
            boolean nospeak) throws Exception;
    
    // Select one
    UserBean select(String uname) throws Exception;
    
    // Select all
    List<UserBean> selectAll() throws Exception;
    
    
    UserBean select(int uid) throws Exception;

    boolean updatevip(int uid, boolean vip) throws Exception;
}
