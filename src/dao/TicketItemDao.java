package dao;

import java.util.List;

import bean.TicketItemBean;

public interface TicketItemDao {
    // Select ticket-items by order
    List<TicketItemBean> selectByOno(String ono) throws Exception;
        
    // Add a new ticket-item
    boolean addTicketItem(double tiprice, int ssno, String ono) throws Exception;
    
    // Delete an ticket-item
    boolean delTicketItem(int tino) throws Exception;
    
    // Update items by oder
    boolean updateItems(int ono, double tiprice) throws Exception;


}
