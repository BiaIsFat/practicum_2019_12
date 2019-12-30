package serviceImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.FilmBean;
import bean.SessionBean;
import dao.FilmDao;
import dao.ViewDao;
import daoImpl.FilmDaoImpl;
import daoImpl.ViewDaoImpl;
import service.FilmService;
import util.DBUtil;

public class FilmServiceImpl implements FilmService {
    
    private Connection conn;
    private FilmDao film_dao;

    public FilmServiceImpl() {

    }
    
    @Override
    public List<FilmBean> findByKeyword(String keyword) {
        this.film_dao = new FilmDaoImpl();
        // 获取connection
        this.conn = DBUtil.getConn();
        // 声明局部变量
        List<FilmBean> film_list = new ArrayList<FilmBean>();
        
        try {
            // 开始事务
            conn.setAutoCommit(false);

            /*---------业务处理部分------------*/
            // 1.判断关键字是否为空
            if(keyword==null) {
                // 2.1若关键字为空，则搜索所有电影
                film_list = film_dao.select();
            } else {
                // 2.2若关键字不为空，则使用关键字搜索电影
                film_list = film_dao.selectByKeyword(keyword);
            }
            /* --------业务处理完成------------ */ 
            // 提交事务
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
        return film_list;
    }

    @Override
    public FilmBean findOne(int fno) {
        this.film_dao = new FilmDaoImpl();
        // 获取connection
        this.conn = DBUtil.getConn();
        // Assign local variable
        FilmBean film = null;
        
        try {
            // Start transaction
            conn.setAutoCommit(false);
            
            film = film_dao.select(fno);
            
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
        
        return film;
    }

    @Override
    public boolean upFilm(String fname,String otime,String actor,String intro, String type,
            String pic, String country, int duration, String view) {
        boolean flag = false;
        FilmDao film_dao = new FilmDaoImpl();
        this.conn = DBUtil.getConn();
        try {
            // Start transaction
            conn.setAutoCommit(false);
           if(film_dao.find_one(fname)==null) {
            flag = film_dao.addFilm(fname,otime,actor,intro, type,
                    pic, country, duration, view);
           }
           else {
               flag=false;
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
        } finally {
            DBUtil.close();
        }
        
        return flag;
    }

    @Override
    public boolean downFilm(int fno) {
        boolean flag = false;
        FilmDao film_dao = new FilmDaoImpl();
        this.conn=DBUtil.getConn();
        try {
            // Start transaction
            conn.setAutoCommit(false);
            flag=film_dao.downFilm(fno,true);
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
    public boolean changeFilmInfo(int fno, String fname, String otime, String actor, String intro, String type, String pic,
            String country, int duration, String view, boolean forbidden) {
        boolean flag = false;
        FilmDao film_dao = new FilmDaoImpl();
        try {
            // Start transaction
            conn.setAutoCommit(false);
            flag=film_dao.updateFilm(fno,fname,otime,actor,intro,type,pic,country,duration,view,forbidden);
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
    public List<FilmBean> findAll() {
        this.conn = DBUtil.getConn();
        this.film_dao = new FilmDaoImpl();
        List<FilmBean> film_list = null;
        try {
            film_list = film_dao.select();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return film_list;
    }

    @Override
    public List<Object> findView() {
        // TODO Auto-generated method stub
        return null;
    }

}













