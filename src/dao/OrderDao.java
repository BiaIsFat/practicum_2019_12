package dao;

import java.util.List;

import bean.OrderBean;

public interface OrderDao {
    // Select order by user
    List<OrderBean> selectByUid(int uid) throws Exception;
    
    // Select one order
    OrderBean select(String ono) throws Exception;
    
    // Add a new Order
    boolean addOrder(String ono, double total, String otime, int uid, long sno, int fno) throws Exception;
    
    // Delete an Order
    boolean delOrder(String ono) throws Exception;
    
    // Modify an Order
    boolean updateOrder(String ono, double total, boolean status, double grade) throws Exception;

    boolean updateOrderStatus(String ono, boolean status) throws Exception;



}
