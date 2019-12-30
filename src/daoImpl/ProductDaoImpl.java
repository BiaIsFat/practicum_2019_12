package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ProductBean;
import dao.ProductDao;
import util.DBUtil;

public class ProductDaoImpl implements ProductDao {
    private ResultSet rs = null;
    @Override
    public boolean addProduct(String name, double price) throws Exception {
        int row = 0;
        String sql = "insert into product(name, price) values(?,?)";
        row = DBUtil.executeUpdate(sql, name, price);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean delProduct(int pno) throws Exception {
        int row = 0;
        String sql = "delete from product where pno = ?";
        row = DBUtil.executeUpdate(sql, pno);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean updateProduct(int pno, String name, double price) throws Exception {
        int row = 0;
        String sql = "update product set name=?, price=? where pno=?";
        row = DBUtil.executeUpdate(sql, name, price, pno);
        return (row!=0) ? true : false;
    }

    @Override
    public ProductBean select(int pno) throws Exception {
        ProductBean prod = null;
        String sql = "select * from product where pno = ?";
        rs = DBUtil.executeQuery(sql, pno);
        while(rs.next()) {
            prod = new ProductBean();
            prod.setPno(rs.getInt("pno"));
            prod.setName(rs.getString("name"));
            prod.setPrice(rs.getDouble("price"));
        }
        return prod;
    }

    @Override
    public List<ProductBean> select() throws Exception {
        List<ProductBean> pro_list = new ArrayList<ProductBean>();
        String sql = "select * from product";
        rs = DBUtil.executeQuery(sql);
        while(rs.next()) {
            ProductBean prod = new ProductBean();
            prod.setPno(rs.getInt("pno"));
            prod.setName(rs.getString("name"));
            prod.setPrice(rs.getDouble("price"));
            pro_list.add(prod);
        }
        return pro_list;
    }

}
