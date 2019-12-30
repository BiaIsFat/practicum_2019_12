
package dao;

import java.util.List;

import bean.OtherItemBean;

public interface OtherItemDao {
    // Select other items by order
    List<OtherItemBean> select(int ono) throws Exception;
        
    // Add a new other item
    boolean addOtherItem(double oiprice, int quantity, int pno, int ono) throws Exception;
    
    // Delete an other item
    boolean delOtherItem(int oino) throws Exception;
    
    // Update items by order
    boolean updateItems(int oino, double oiprice, int quantity) throws Exception;
}
