package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.PAdminBean;
import dao.PAdminDao;
import util.DBUtil;

public class PAdminDaoImpl implements PAdminDao {
    private ResultSet rs = null;

    @Override
    public PAdminBean select(String account) throws Exception {
        PAdminBean padmin = null;
        String sql = "select * from padmin where account=?";
        rs = DBUtil.executeQuery(sql, account);
        while(rs.next()) {
            padmin = new PAdminBean();
            padmin.setAccount(rs.getString("account"));
            padmin.setPwd(rs.getString("pwd"));
        }
        return padmin;
    }

    @Override
    public List<PAdminBean> select() throws Exception {
        List<PAdminBean> padmin_list = new ArrayList<PAdminBean>();
        String sql = "select * from padmin";
        rs = DBUtil.executeQuery(sql);
        while(rs.next()) {
            PAdminBean padmin = new PAdminBean();
            padmin.setAccount(rs.getString("account"));
            padmin.setPwd(rs.getString("pwd"));
            padmin_list.add(padmin);
        }
        return padmin_list;
    }

    @Override
    public boolean addPAdmin(String account, String pwd) throws Exception {
        int row = 0;
        String sql = "insert into padmin values(?,?)";
        row = DBUtil.executeUpdate(sql, account, pwd);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean updatePAdmin(String account, String pwd) throws Exception {
        int row = 0;
        String sql = "update padmin set pwd=? where account=?";
        row = DBUtil.executeUpdate(sql, pwd, account);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean delPAdmin(String account) throws Exception {
        int row = 0;
        String sql = "delete from padmin where account = ?";
        row = DBUtil.executeUpdate(sql, account);
        return (row!=0) ? true : false;
    }

}
