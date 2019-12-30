package daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CAdminBean;
import dao.CAdminDao;
import util.DBUtil;

public class CAdminDaoImpl implements CAdminDao {

    private ResultSet rs = null;
    
    @Override
    public CAdminBean select(String account) throws Exception {
        CAdminBean cadmin = null;
        String sql="select * from cadmin where account=?";
        rs = DBUtil.executeQuery(sql, account);
        while(rs.next()) {
            cadmin = new CAdminBean();
            cadmin.setUid(rs.getInt("uid"));
            cadmin.setAccount(rs.getString("account"));
            cadmin.setPwd(rs.getString("pwd"));
            cadmin.setCinema(new CinemaDaoImpl().select(rs.getInt("cno")));
        }
        return (cadmin!=null) ? cadmin : null;
    }

    @Override
    public List<CAdminBean> select() throws Exception {
        List<CAdminBean> cadmin_list = new ArrayList<CAdminBean>();
        String sql = "select * from cadmin";
        rs = DBUtil.executeQuery(sql);
        while(rs.next()) {
            CAdminBean cadmin = new CAdminBean();
            cadmin.setUid(rs.getInt("uid"));
            cadmin.setAccount(rs.getString("account"));
            cadmin.setPwd(rs.getString("pwd"));
            cadmin_list.add(cadmin);
        }
        return cadmin_list;
    }

    @Override
    public boolean addCAdmin(String account, String pwd, int cno) throws Exception {
        int row = 0;
        String sql = "insert into cadmin(account, pwd, cno) values (?,?,?)";
        row = DBUtil.executeUpdate(sql, account, pwd, cno);
        
        return (row!=0) ? true : false;
    }

    @Override
    public boolean updateCAdmin(int uid, String account, String pwd, int cno) throws Exception {
        int row = 0;
        String sql = "update cadmin set account=?, pwd=?, cno=? where uid=?";
        row = DBUtil.executeUpdate(sql, account, pwd, cno, uid);
        return (row!=0) ? true : false;
    }

    @Override
    public boolean delCAdmin(int uid) throws Exception {
        int row = 0;
        String sql = "delete from cadmin where uid=?";
        row = DBUtil.executeUpdate(sql, uid);
        return (row!=0) ? true : false;
    }

}
