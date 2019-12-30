package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.OrderBean;
import bean.TicketItemBean;
import dao.OrderDao;
import util.DBUtil;

public class OrderDaoImpl implements OrderDao {
    
    private ResultSet rs = null;

    @Override
    public List<OrderBean> selectByUid(int uid) throws Exception {
        List<OrderBean> order_list = new ArrayList<OrderBean>();
        String sql = "select * from `order` where uid=? order by otime desc";
        rs = DBUtil.executeQuery(sql, uid);
        while(rs.next()) {
            OrderBean order = new OrderBean();
            order.setOno(rs.getString("ono"));
            order.setTotal(rs.getDouble("total"));
            order.setOtime(rs.getTimestamp("otime"));
            order.setStatus(rs.getBoolean("status"));
            order.setGrade(rs.getDouble("grade"));
            List<TicketItemBean> ticket_list = new TicketItemDaoImpl().selectByOno(rs.getString("ono"));
            order.setTicket_item_list(ticket_list);
            order.setSession(new SessionDaoImpl().select(rs.getLong("sno")));
            order_list.add(order);
        }
        return order_list;
    }

    @Override
    public OrderBean select(String ono) throws Exception {
        OrderBean order = null;
        String sql = "select * from `order` where ono = ? order by otime desc";
        rs = DBUtil.executeQuery(sql, ono);
        while(rs.next()) {
            order = new OrderBean();
            order.setOno(rs.getString("ono"));
            order.setTotal(rs.getDouble("total"));
            order.setOtime(rs.getTimestamp("otime"));
            order.setStatus(rs.getBoolean("status"));
            order.setGrade(rs.getDouble("grade"));
            List<TicketItemBean> ticket_list = new TicketItemDaoImpl().selectByOno(rs.getString("ono"));
            order.setTicket_item_list(ticket_list);
            order.setSession(new SessionDaoImpl().select(rs.getLong("sno")));
        }
        return order;
    }

    @Override
    public boolean addOrder(String ono, double total, String otime, int uid, long sno, int fno) throws Exception {
        int row = 0;
        String sql = "insert into `order`(ono, total, otime, uid, sno, fno) values(?,?,?,?,?,?)";
        row = DBUtil.executeUpdate(sql, ono, total, otime, uid, sno, fno);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean delOrder(String ono) throws Exception {
        int row = 0;
        String sql = "delete from `order` where ono = ?";
        row = DBUtil.executeUpdate(sql, ono);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean updateOrder(String ono, double total, boolean status, double grade) throws Exception {
        int row = 0;
        String sql = "update `order` set total=?, status=?, grade=? where ono=?";
        row = DBUtil.executeUpdate(sql, total, status, grade, ono);
        return (row!=0) ? true : false;
    }
    @Override
    public boolean updateOrderStatus(String ono, boolean status) throws Exception {
        // TODO 自动生成的方法存根
        int row = 0;
        String sql = "insert into `order`(ono,status) values(?,?)";
        row = DBUtil.executeUpdate(sql,ono,status);
        return (row!=0) ? true : false;
    }

}
