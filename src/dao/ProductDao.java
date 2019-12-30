package dao;

import java.util.List;

import bean.ProductBean;

public interface ProductDao {
    // Add a new product
    boolean addProduct(String name, double price) throws Exception;
    
    // Delete
    boolean delProduct(int pno) throws Exception;
    
    // Update
    boolean updateProduct(int pno, String name, double price) throws Exception;
    
    // select one product
    ProductBean select(int pno) throws Exception;
    
    // select all products
    List<ProductBean> select() throws Exception;


}
