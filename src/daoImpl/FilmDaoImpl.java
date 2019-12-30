package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import bean.FilmBean;
import dao.FilmDao;
import util.DBUtil;

public class FilmDaoImpl implements FilmDao {

    private ResultSet rs;
    private ResultSet rs_view;

    public FilmDaoImpl() {
    }

    @Override
    public FilmBean select(int fno) throws Exception {
        String sql_film = "select * from film where fno = ?";
        FilmBean film = new FilmBean();
        rs = DBUtil.executeQuery(sql_film, fno);
        String sql_view = "select * from v_film_view where fno = ?";
        while (rs.next()) {
            rs_view = DBUtil.executeQuery(sql_view, fno);
            film.setFno(rs.getInt("fno"));
            film.setFname(rs.getString("fname"));
            film.setOntime(rs.getDate("ontime"));
            film.setIntro(rs.getString("intro"));
            film.setType(rs.getString("type"));
            film.setActor(rs.getString("actor"));
            film.setPic(rs.getString("pic"));
            film.setCountry(rs.getString("country"));
            film.setDuration(rs.getInt("duration"));
            film.setView(rs.getString("view"));
            film.setForbidden(rs.getBoolean("forbidden"));
            while (rs_view.next()) {
                film.setGrades(rs_view.getDouble("avg_grades"));
                film.setBoxoffice(rs_view.getDouble("boxoffice"));
                film.setOccupancy(rs_view.getDouble("occupancy"));
            }
        }
        return film;
    }

    @Override
    public List<FilmBean> selectByKeyword(String keyword) throws Exception {
        List<FilmBean> film_list = new ArrayList<FilmBean>();
        String sql = "select * from film where fname like ?";
        // 处理keyword，在两边加上%
        // select * from film where fname like "%keyword%"
        keyword = "%" + keyword + "%";
        rs = DBUtil.executeQuery(sql, keyword);
        String sql_view = "select * from v_film_view where fno = ?";
        while (rs.next()) {
            rs_view = DBUtil.executeQuery(sql_view, rs.getInt("fno"));
            FilmBean film = new FilmBean();
            film.setFno(rs.getInt("fno"));
            film.setFname(rs.getString("fname"));
            film.setOntime(rs.getDate("ontime"));
            film.setIntro(rs.getString("intro"));
            film.setType(rs.getString("type"));
            film.setActor(rs.getString("actor"));
            film.setPic(rs.getString("pic"));
            film.setCountry(rs.getString("country"));
            film.setDuration(rs.getInt("duration"));
            film.setView(rs.getString("view"));
            film.setForbidden(rs.getBoolean("forbidden"));
            while (rs_view.next()) {
                film.setGrades(rs_view.getDouble("avg_grades"));
                film.setBoxoffice(rs_view.getDouble("boxoffice"));
                film.setOccupancy(rs_view.getDouble("occupancy"));
            }
            film_list.add(film);
        }

        return film_list;
    }

    @Override
    public boolean addFilm(String fname, String otime, String actor, String intro, String type, String pic,
            String country, int duration, String view) throws Exception {
        int row = 0;
        String sql = "insert into film (fname, ontime, actor, intro, type, pic, country, duration, view)"
                + "values(?,?,?,?,?,?,?,?,?)";
        row = DBUtil.executeUpdate(sql, fname, otime, actor, intro, type, pic, country, duration, view);
        return (row != 0) ? true : false;
    }

    @Override
    public boolean updateFilm(int fno, String fname, String otime, String actor, String intro, String type, String pic,
            String country, int duration, String view, boolean forbidden) throws Exception {
        int row = 0;
        String sql = "update film set fname=?, otime=?, actor=?, intro=?, type=?, pic=?, country=?, duration=?"
                + ",view=?, forbidden=? where fno=?";
        row = DBUtil.executeUpdate(sql, fname, otime, actor, intro, type, pic, country, duration, view, forbidden);
        return (row != 0) ? true : false;
    }

    @Override
    public List<FilmBean> select() throws Exception {
        List<FilmBean> film_list = new ArrayList<FilmBean>();
        String sql = "select * from film";
        rs = DBUtil.executeQuery(sql);
        String sql_view = "select * from v_film_view where fno = ?";
        while (rs.next()) {
            FilmBean film = new FilmBean();
            rs_view = DBUtil.executeQuery(sql_view, rs.getInt("fno"));
            film.setFno(rs.getInt("fno"));
            film.setFname(rs.getString("fname"));
            film.setOntime(rs.getDate("ontime"));
            film.setIntro(rs.getString("intro"));
            film.setType(rs.getString("type"));
            film.setActor(rs.getString("actor"));
            film.setPic(rs.getString("pic"));
            film.setCountry(rs.getString("country"));
            film.setDuration(rs.getInt("duration"));
            film.setView(rs.getString("view"));
            film.setForbidden(rs.getBoolean("forbidden"));
            while (rs_view.next()) {
                film.setGrades(rs_view.getDouble("avg_grades"));
                film.setBoxoffice(rs_view.getDouble("boxoffice"));
                film.setOccupancy(rs_view.getDouble("occupancy"));
            }
            film_list.add(film);
        }
        return film_list;
    }
    
    @Override
    public FilmBean find_one(String fname) throws Exception{
        // TODO 自动生成的方法存根
        FilmBean film=null;
        String sql="select * from film where fname =?";
        rs = DBUtil.executeQuery(sql,fname);
        while (rs.next()) {
            film = new FilmBean();
            film.setFno(rs.getInt("fno"));
            film.setFname(rs.getString("fname"));
            film.setOntime(rs.getDate("ontime"));
            film.setIntro(rs.getString("intro"));
            film.setType(rs.getString("type"));
            film.setActor(rs.getString("actor"));
            film.setPic(rs.getString("pic"));
            film.setCountry(rs.getString("country"));
            film.setDuration(rs.getInt("duration"));
            film.setView(rs.getString("view"));
            film.setForbidden(rs.getBoolean("forbidden"));
        }
        
        return film;
    }

    @Override
    public boolean downFilm(int fno, boolean forbidden) throws Exception {
        // TODO 自动生成的方法存根
            int row = 0;
            String sql = "update film set forbidden=? where fno=?";
            row = DBUtil.executeUpdate(sql,forbidden,fno);
            return (row!=0) ? true : false;
    }
}
