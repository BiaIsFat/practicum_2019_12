package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CinemaBean;
import dao.CinemaDao;
import util.DBUtil;

public class CinemaDaoImpl implements CinemaDao {

    private ResultSet rs = null;
    
    @Override
    public CinemaBean select(int cno) throws Exception {
        CinemaBean cinema = null;
        String sql = "select * from cinema where cno = ?";
        rs = DBUtil.executeQuery(sql, cno);
        while(rs.next()) {
            cinema = new CinemaBean();
            cinema.setCno(rs.getInt("cno"));
            cinema.setCname(rs.getString("cname"));
            cinema.setAddr(rs.getString("addr"));
            cinema.setWorktime(rs.getString("worktime"));
            cinema.setTel(rs.getString("tel"));
        }
        return cinema;
    }

    @Override
    public List<CinemaBean> select() throws Exception {
        List<CinemaBean> cinema_list = new ArrayList<CinemaBean>();
        String sql = "select * from cinema";
        rs = DBUtil.executeQuery(sql);
        while(rs.next()) {
            CinemaBean cinema = new CinemaBean();
            cinema.setCno(rs.getInt("cno"));
            cinema.setCname(rs.getString("cname"));
            cinema.setAddr(rs.getString("addr"));
            cinema.setWorktime(rs.getString("worktime"));
            cinema.setTel(rs.getString("tel"));
            cinema_list.add(cinema);
        }
        return cinema_list;
    }

    @Override
    public boolean AddCinema(String cname, String addr, String worktime, 
            String tel) throws Exception {
        int row = 0;
        String sql = "insert into cinema(cname,addr,worktime,tel) values(?,?,?,?)";
        row = DBUtil.executeUpdate(sql, cname, addr, worktime, tel);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean updateCinema(int cno, String cname, String addr, String worktime, 
            String tel) throws Exception {
        int row = 0;
        String sql = "update cinema set cname=?, addr=?, worktime=?, tel=? where cno=?";
        row = DBUtil.executeUpdate(sql, cname, addr, worktime, tel, cno);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean delCinema(int cno) throws Exception {
        int row = 0;
        String sql = "delete from cinema where cno=?";
        row = DBUtil.executeUpdate(sql, cno);
        return (row!=0) ? true : false;
    }

    @Override
    public List<CinemaBean> selectByFno(int fno) throws Exception {
        List<CinemaBean> cinema_list = new ArrayList<CinemaBean>();
        String sql = "select * from cinema where cno in ( " + 
                "SELECT cno " + 
                "FROM film a, session b " + 
                "where a.fno = b.fno and a.fno = ?)";
        rs = DBUtil.executeQuery(sql,fno);
        while(rs.next()) {
            CinemaBean cinema = new CinemaBean();
            cinema.setCno(rs.getInt("cno"));
            cinema.setCname(rs.getString("cname"));
            cinema.setAddr(rs.getString("addr"));
            cinema.setWorktime(rs.getString("worktime"));
            cinema.setTel(rs.getString("tel"));
            cinema_list.add(cinema);
        }
        return cinema_list;
    }

    @Override
    public List<CinemaBean> selectByKeyword(String keyword) throws Exception {
        List<CinemaBean> cinema_list = new ArrayList<CinemaBean>();
        String sql = "select * from cinema where cname like ?";
        keyword = "%" + keyword + "%";
        rs = DBUtil.executeQuery(sql, keyword);
        while(rs.next()) {
            CinemaBean cinema = new CinemaBean();
            cinema.setCno(rs.getInt("cno"));
            cinema.setCname(rs.getString("cname"));
            cinema.setAddr(rs.getString("addr"));
            cinema.setWorktime(rs.getString("worktime"));
            cinema.setTel(rs.getString("tel"));
            cinema_list.add(cinema);
        }
        return cinema_list;
    }

}
