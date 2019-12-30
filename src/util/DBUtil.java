/**
 * MySQL Util Class
 * Written by Bia
 * 2019-12-9
 */
package util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {

    private static final String driver   = "com.mysql.jdbc.Driver";   // 数据库驱动
    private static final String url      = "jdbc:mysql://192.168.43.130:3306/class_design?characterEncoding=UTF-8";// 数据库地址
    private static final String username = "lmx";                // 数据库用户名
    private static final String password = "123";            // 数据库密码
    private static PreparedStatement ps  = null;
    private static ResultSet         rs  = null;
    private static Connection conn = null;   // 数据库连接
    private static ThreadLocal<Connection> threadlocal = new ThreadLocal<Connection>();
    
    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public static Connection getConn() {
            try {
                conn = (Connection) threadlocal.get();
                if(conn == null) {
                    conn = DriverManager.getConnection(url, username, password);
                    threadlocal.set(conn);
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.out.println("link failed");
                e.printStackTrace();
            }
        return conn;
    }
   
    // Set parameters for PreparedStatement
    private static PreparedStatement setParameters(String sql, Object[] args) throws SQLException {
        ps = null;
        ps = conn.prepareStatement(sql);
        for(int i = 0; i < args.length; i++) {
            ps.setObject(i+1, args[i]);
        }
        return ps;
    }
    
    /*
     *  Execute Insert/Update/Delete operation
     *  @return affected rows
     */
    public static int executeUpdate(String sql, Object... args) throws SQLException {
        int row = 0;
        setParameters(sql, args);
        row = ps.executeUpdate();
        return row;
    }
    
    /*
     *  Execute Select operation
     *  @return ResultSet
     */
    public static ResultSet executeQuery(String sql, Object... args) throws SQLException {
        rs = null;
        setParameters(sql, args);
        rs = ps.executeQuery();
        return rs;
    }
    
    /*
     * Close all connections:
     * conn/ps/rs
     */
    public static void close() {
            try {
                if(threadlocal.get() != null) {
                    threadlocal.remove();
                }
                if(conn != null) {
                    conn.close();
                }
                if(ps != null) {
                    ps.close();
                }
                if(rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
    }
}

