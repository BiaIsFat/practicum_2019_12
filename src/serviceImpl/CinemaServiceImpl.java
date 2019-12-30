package serviceImpl;

import java.sql.Connection;
import java.util.List;

import bean.CinemaBean;
import bean.SessionBean;
import dao.CinemaDao;
import dao.SessionDao;
import daoImpl.CinemaDaoImpl;
import daoImpl.SessionDaoImpl;
import service.CinemaService;
import util.DBUtil;

public class CinemaServiceImpl implements CinemaService {

    
    @Override
    public boolean addCinema(String cname,String worktime,String addr,String tel) {
        // TODO Auto-generated method stub
        Connection conn=DBUtil.getConn();
         boolean flag = false;
         CinemaDao cinema_dao = new CinemaDaoImpl();
         try {
             // Start transaction
             conn.setAutoCommit(false);
             flag=cinema_dao.AddCinema(cname, addr, worktime, tel);
             // complete transaction
             conn.commit();
         } catch (Exception e) {
             // TODO Auto-generated catch block
             // error occur
             try {
                 conn.rollback();
             } catch (Exception e1) {
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
    public boolean logoffCinema(int cno) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean changeCinema(int cno) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public List<CinemaBean> findAll() {
        DBUtil.getConn();
        CinemaDao cinema_dao= new CinemaDaoImpl();
        List<CinemaBean> cinema_list = null;
        try {
            cinema_list = cinema_dao.select();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return cinema_list;
    }

    @Override
    public List<CinemaBean> findByKeyWord(String keyword) {
        DBUtil.getConn();
        CinemaDao cinema_dao= new CinemaDaoImpl();
        List<CinemaBean> cinema_list = null;
        try {
            cinema_list = cinema_dao.selectByKeyword(keyword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cinema_list;
    }

    @Override
    public CinemaBean findOne(int cno) {
        DBUtil.getConn();
        CinemaDao cinema_dao= new CinemaDaoImpl();
        CinemaBean cinema = null;
        
        try {
            
            cinema = cinema_dao.select(cno);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return cinema;
    }

    @Override
    public List<SessionBean> findSession(int fno, int cno) {
        
        DBUtil.getConn();
        
        List<SessionBean> session_list = null;
        
        SessionDao session_dao = new SessionDaoImpl();
        
        try {
            
            session_list = session_dao.select(fno, cno);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return session_list;
    }

    @Override
    public boolean planSessionInfo(SessionBean session) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public List<SessionBean> findSession(int cno) {
DBUtil.getConn();
        
        List<SessionBean> session_list = null;
        
        SessionDao session_dao = new SessionDaoImpl();
        
        try {
            
            session_list = session_dao.selectByCno(cno);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return session_list;
    }

    @Override
    public List<CinemaBean> findByFilm(int fno) {
        DBUtil.getConn();
        CinemaDao Cinema_dao = new CinemaDaoImpl();
        List<CinemaBean> cinema_list = null;
        try {
            
            cinema_list = Cinema_dao.selectByFno(fno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        
        
        
        return cinema_list;
    }

}
