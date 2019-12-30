package daoImpl;

import java.awt.image.DataBufferUShort;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.TicketItemBean;
import dao.TicketItemDao;
import util.DBUtil;

public class TicketItemDaoImpl implements TicketItemDao {
	
	private ResultSet rs=null;

	@Override
	public List<TicketItemBean> selectByOno(String ono) throws Exception {
		// TODO 自动生成的方法存根
		List<TicketItemBean> TicketItem_list= new ArrayList<TicketItemBean>();
		String sql="select * from ticket_item where ono = ?";
		rs=DBUtil.executeQuery(sql,ono);
		while(rs.next()) {
			TicketItemBean ticketitem=new TicketItemBean();
			ticketitem.setTino(rs.getInt("tino"));
			ticketitem.setTiprice(rs.getDouble("tiprice"));
			ticketitem.setSession_seat(new SessionSeatDaoImpl().select(rs.getInt("ssno")));
		    TicketItem_list.add(ticketitem);
		}
		return TicketItem_list;
	}

	@Override
	public boolean addTicketItem(double tiprice,int ssno,String ono) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="insert into ticket_item (tiprice,ssno,ono) values(?,?,?)";
		row=DBUtil.executeUpdate(sql,tiprice,ssno,ono);		
		return (row!=0) ? true:false;
	}

	@Override
	public boolean delTicketItem(int tino) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="delect * from ticket_item where tino = ?";
		row=DBUtil.executeUpdate(sql, tino);
		return (row!=0)? true:false;
	}

	@Override
	public boolean updateItems(int ono,double tiprice) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="update ticket_item set tiprice = ? where ono=?";
		row=DBUtil.executeUpdate(sql,tiprice,ono);		
		return (row!=0) ? true:false;

	}

}
