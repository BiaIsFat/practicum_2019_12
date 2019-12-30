package dao;

import java.util.List;

import bean.CAdminBean;

public interface CAdminDao {
    // Select one cinema-administrator
    CAdminBean select(String account) throws Exception;
    
    // Select all cinema-administrator
    List<CAdminBean> select() throws Exception;
    
    // Add a cinema-administrator
    boolean addCAdmin(String account, String pwd, int cno) throws Exception;
    
    // Update information for a cinema-administrator
    boolean updateCAdmin(int uid, String account, String pwd, int cno) throws Exception;
    
    // Delete a cinema-administrator
    boolean delCAdmin(int uid) throws Exception;


}
