package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.OtherItemBean;
import dao.OtherItemDao;
import util.DBUtil;

public class OtherItemDaoImpl implements OtherItemDao {
    
    private ResultSet rs = null;

    @Override
    public List<OtherItemBean> select(int ono) throws Exception {
        List<OtherItemBean> other_list = new ArrayList<OtherItemBean>();
        String sql = "select * from other_item where ono=?";
        rs = DBUtil.executeQuery(sql, ono);
        while(rs.next()) {
            OtherItemBean other = new OtherItemBean();
            other.setOino(rs.getInt("oino"));
            other.setOiprice(rs.getDouble("oiprice"));
            other.setQuantity(rs.getInt("quantity"));
            other_list.add(other);
        }
        return other_list;
    }

    @Override
    public boolean addOtherItem(double oiprice, int quantity, int pno, int ono) throws Exception {
        int row = 0;
        String sql = "insert into other_item(oiprice, quantity, pno, ono) values(?,?,?,?)";
        row = DBUtil.executeUpdate(sql, oiprice, quantity, pno, ono);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean delOtherItem(int oino) throws Exception {
        int row = 0;
        String sql = "delete from other_item where oino = ?";
        row = DBUtil.executeUpdate(sql, oino);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean updateItems(int oino, double oiprice, int quantity) throws Exception {
        int row = 0;
        String sql = "update other_item set oiprice=?, quantity=? where oino=?";
        row = DBUtil.executeUpdate(sql, oiprice, quantity, oino);
        return (row!=0) ? true : false;
    }

}
