package serviceImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import bean.CommentBean;
import bean.OrderBean;
import bean.SessionBean;
import bean.UserBean;
import dao.OrderDao;
import dao.SessionDao;
import dao.SessionSeatDao;
import dao.TicketItemDao;
import dao.UserDao;
import daoImpl.OrderDaoImpl;
import daoImpl.SessionDaoImpl;
import daoImpl.SessionSeatDaoImpl;
import daoImpl.TicketItemDaoImpl;
import daoImpl.UserDaoImpl;
import service.OrderService;
import util.DBUtil;

public class OrderServiceImpl implements OrderService {

    private Connection conn = null;

    @Override
    public boolean reTicket(String ono) {
        // TODO 自动生成的方法存根
        return false;
    }

    @Override
    public boolean changeTicket(String ono) {
        // TODO 自动生成的方法存根
        OrderBean orderbean = new OrderBean();
        OrderDao orderdao = new OrderDaoImpl();
        conn = DBUtil.getConn();
        boolean flag = false;
        try {
            // 开始事务
            conn.setAutoCommit(false);
            flag = orderdao.updateOrderStatus(ono, true);
            conn.commit();
        } catch (Exception e) {
            // 发生错误，回滚事务
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            DBUtil.close();
        }
        // 返回业务处理结果
        return flag;
    }

    @Override
    public boolean evaluationFilm(CommentBean com) {
        // TODO 自动生成的方法存根
        return false;
    }

    /*
     * Author: zlf 
     * Modify by: Bia 
     * 2019-12-25 00:22:10
     */
    @Override
    public boolean takeOrder(double total, int uid, long sno, int fno, int[] ssno_arr) {
        // OrderBean order_add=new OrderBean();
        OrderDao order_dao = new OrderDaoImpl();
        // TicketItemBean orderItembean = new TicketItemBean();
        TicketItemDao ticket_dao = new TicketItemDaoImpl();
        SessionDao session_dao = new SessionDaoImpl();
        UserDao user_dao = new UserDaoImpl();
        SessionSeatDao sseat_dao = new SessionSeatDaoImpl();
        conn = DBUtil.getConn();
        boolean flag = false;
        try {
            // 开始事务
            conn.setAutoCommit(false);
            // Get current time
            Date time = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String otime = sdf.format(time);
            // 1. Change seat status
            for(int i = 0; i < ssno_arr.length; i++) {
                flag = sseat_dao.updateSessionSeat(ssno_arr[i], true);
                if(!flag) {
                    throw new Exception();
                }
            }
            /*
             * 2. In consideration of the concurrent access 
             * And the convenience of inserting ticket-items after order inserted 
             * Unique order-no is required 
             * Generate order-id by millisecond + user-id
             */
            String ono = String.valueOf(time.getTime()) + uid;
            // 3.If the user is vip, take 10% off the total price 
            UserBean user = user_dao.select(uid);
            boolean isVip = user.isVip();
            if(isVip) {
                total = total * 0.9;
            }
            // 4.Insert into order table
            flag = order_dao.addOrder(ono, total, otime, uid, sno, fno);

            // 5.Judge the result so far
            if (!flag) {
                throw new Exception();
            }
            
            // 6. Insert into ticket_item table, may has multiple records
            // 6.1 Get tiprice
            SessionBean session = session_dao.select(sno);
            // 6.2 Insert into table one by one
            double tiprice = session.getPrice();
            for (int i = 0; i < ssno_arr.length; i++) {
                flag = ticket_dao.addTicketItem(tiprice, ssno_arr[i], ono);
                if(!flag) throw new Exception();
            }

            // 7.Transaction commit
            conn.commit();

        } catch (Exception e) {
            // 发生错误，回滚事务
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            DBUtil.close();
        }
        // 返回业务处理结果
        return flag;
    }

    @Override
    public boolean setGrades(double grades, String ono) {
        this.conn = DBUtil.getConn();
        OrderDao order_dao = new OrderDaoImpl();
        OrderBean order = null;
        boolean flag = false;
        try {
            conn.setAutoCommit(false);
            order = order_dao.select(ono);
            flag = order_dao.updateOrder(ono, order.getTotal(), order.getStatus(), grades);
            
            conn.commit();
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return flag;
    }

    /*
    @Override
    public boolean takeOrderItem(double tiprice, int ssno, int ono) {
        // TODO 自动生成的方法存根
        TicketItemBean order_add = new TicketItemBean();
        TicketItemDao ticketitemdao = new TicketItemDaoImpl();
        // TicketItemBeanorderItembean = new TicketItemBean();
        // TicketItemDao ticketdao=new TicketItemDaoImpl();
        conn = DBUtil.getConn();
        boolean flag_ticket = false;
        try { // 开始事务
            conn.setAutoCommit(false);
            flag_ticket = ticketitemdao.addTicketItem(tiprice, ssno, ono);
            conn.commit();
        } catch (Exception e) { // 发生错误，回滚事务
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            DBUtil.close();
        } // 返回业务处理结果
        return flag_ticket;
    }
*/
}
