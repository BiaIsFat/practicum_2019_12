package serviceImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import bean.CAdminBean;
import bean.FilmBean;
import bean.SeatBean;
import bean.SessionBean;
import bean.SessionSeatBean;
import dao.CAdminDao;
import dao.FilmDao;
import dao.SeatDao;
import dao.SessionDao;
import dao.SessionSeatDao;
import daoImpl.CAdminDaoImpl;
import daoImpl.FilmDaoImpl;
import daoImpl.SeatDaoImpl;
import daoImpl.SessionDaoImpl;
import daoImpl.SessionSeatDaoImpl;
import service.SessionSeatService;
import util.DBUtil;

public class SessionSeatServiceImpl implements SessionSeatService {

    private Connection conn;
    private SessionSeatDao sessionseat_dao;
    private SeatDao seat_dao;
    private SessionDao session_dao;

    @Override
    public boolean planSessionSeatInfo(String begin_time,double price,int rno,int fno,String account) {
        // TODO 自动生成的方法存根
        boolean flag=false;
        conn = DBUtil.getConn();
        session_dao=new SessionDaoImpl();
        CAdminDao cadmin_dao = new CAdminDaoImpl();
        FilmDao film_dao = new FilmDaoImpl();
        SessionSeatDao ss_dao = new SessionSeatDaoImpl();
        SeatDao seat_dao = new SeatDaoImpl();
        List<SeatBean> seat_list = null;
         try {
                // Start transaction
                conn.setAutoCommit(false);
                
                // Generate session_no
                Date date = new Date();
                long sno = date.getTime();
                
                int cno = cadmin_dao.select(account).getCinema().getCno();
                
                // Count the end_time
                FilmBean film = film_dao.select(fno);
                int duration = film.getDuration();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                date = sdf.parse(begin_time);
                Calendar calender = Calendar.getInstance();
                calender.setTime(date);
                calender.add(Calendar.MINUTE, duration);
                String end_time = sdf.format(calender.getTime());
                
                // Add session
                flag = session_dao.addSession(sno, begin_time,end_time,price,cno,rno,fno);
                
                // Get all the seats of the room
                seat_list = seat_dao.select(rno);
                
                // Arrange seats
                for(SeatBean seat : seat_list) {
                    flag = ss_dao.addSessionSeat(sno, seat.getSeatno());
                }
                // complete transaction
                conn.commit();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                // error occur
                try {
                    conn.rollback();
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
                e.printStackTrace();
                return false;
            } finally {
                DBUtil.close();
            }
        return flag;
    }

    @Override
    public List<SessionSeatBean> findAll() {
        // TODO 自动生成的方法存根
        return null;
    }

    @Override
    public SessionSeatBean findOne(int ssno) {
        // TODO 自动生成的方法存根

        return null;
    }

    @Override
    public boolean change(int ssno, boolean status) {
        // TODO 自动生成的方法存根
        boolean flag = false;
        this.conn = DBUtil.getConn();
        this.sessionseat_dao = new SessionSeatDaoImpl();
        try {
            // Start transaction
            conn.setAutoCommit(false);

            flag = sessionseat_dao.updateSessionSeat(ssno, status);

            // complete transaction
            conn.commit();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // error occur
            try {
                conn.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return flag;

    }

    @Override
    public SeatBean findseat_one(int ssno) {
        this.conn = DBUtil.getConn();
        this.seat_dao = new SeatDaoImpl();
        SeatBean seat = null;
        try {
            // Start transaction
            conn.setAutoCommit(false);

            seat = seat_dao.findBysseat(ssno);

            // complete transaction
            conn.commit();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // error occur
            try {
                conn.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return seat;
    }

    @Override
    public SessionBean findsession_one(long sno) {
        this.conn = DBUtil.getConn();
        this.session_dao = new SessionDaoImpl();
        SessionBean session = null;
        try {
            // Start transaction
            conn.setAutoCommit(false);

            session = session_dao.select(sno);

            // complete transaction
            conn.commit();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // error occur
            try {
                conn.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return session;

    }

    @Override
    public List<SessionSeatBean> findSeatsBySno(long sno) {
        this.conn = DBUtil.getConn();
        this.sessionseat_dao = new SessionSeatDaoImpl();

        List<SessionSeatBean> sseat_list = new ArrayList<SessionSeatBean>();
        try {
            sseat_list = sessionseat_dao.selectBySno(sno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return sseat_list;
    }

    @Override
    public List<SessionSeatBean> findSeats(int[] ssno_array) {
        DBUtil.getConn();
        this.sessionseat_dao = new SessionSeatDaoImpl();
        List<SessionSeatBean> sseat_list = new ArrayList<SessionSeatBean>();

        try {
            for (int i = 0; i < ssno_array.length; i++) {
                SessionSeatBean sseat = new SessionSeatBean();
                sseat = sessionseat_dao.select(ssno_array[i]);
                sseat_list.add(sseat);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return sseat_list;
    }

    @Override
    public List<SessionBean> findSessionsByCadmin(String account) {
        DBUtil.getConn();
        this.session_dao = new SessionDaoImpl();
        CAdminDao cadmin_dao = new CAdminDaoImpl();
        CAdminBean cadmin = null;
        List<SessionBean> session_list = null;
        FilmDao film_dao = new FilmDaoImpl();
        
        try {
            cadmin = cadmin_dao.select(account);
            session_list = session_dao.selectByCno(cadmin.getCinema().getCno());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return session_list;
    }

    @Override
    public boolean updateSession(int sno, String begin_time, double price) {
        DBUtil.getConn();
        SessionDao session_dao = new SessionDaoImpl();
        FilmDao film_dao = new FilmDaoImpl();
        SessionBean session = new SessionBean();
        boolean flag = false;
        
        try {
            session = session_dao.select(sno);
            FilmBean film = film_dao.select(session.getFilm().getFno());
            int duration = film.getDuration();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            Date date = sdf.parse(begin_time);
            Calendar calender = Calendar.getInstance();
            calender.setTime(date);
            calender.add(Calendar.MINUTE, duration);
            String end_time = sdf.format(calender.getTime());
            flag = session_dao.updateSession(sno, begin_time, end_time, price);
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return flag;
    }

}
