package dao;

import java.util.List;

import bean.PAdminBean;

public interface PAdminDao {
    // select platform-administrator
    PAdminBean select(String account) throws Exception;
    
    // select All platform-administrator
    List<PAdminBean> select() throws Exception;
    
    // Add a new platform-administrator
    boolean addPAdmin(String account, String pwd) throws Exception;
    
    // Update
    boolean updatePAdmin(String account, String pwd) throws Exception;
    
    // Delete
    boolean delPAdmin(String account) throws Exception;


}
