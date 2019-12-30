package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CommentBean;
import dao.CommentDao;
import util.DBUtil;

public class CommentDaoImpl implements CommentDao {

	
	private ResultSet rs=null;
	@Override
	public List<CommentBean> select(int uid) throws Exception {
		// TODO 自动生成的方法存根
		List<CommentBean> comment=new ArrayList<CommentBean>();
		String sql="select * from comment where uid = ?";
		rs = DBUtil.executeQuery(sql, uid);
		while(rs.next()) {
			CommentBean com=new CommentBean();
			com.setCno(rs.getInt("cno"));
			com.setContent(rs.getString("content"));
			com.setCtime(rs.getDate("ctime"));
			com.setReplyno(rs.getInt("replyno"));
			com.setStatus(rs.getBoolean("status"));
			comment.add(com);
		}
		
		return comment;
	}

	@Override
	public boolean addComment(String content,String ctime,int replyno,int uid,int  fno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="insert into comment (content,ctime,replyno,uid,fno) values(?,?,?,?,?)";
		row=DBUtil.executeUpdate(sql,content,ctime,replyno,uid,fno);
		return (row!=0)?true:false;
	}

	@Override
	public boolean delComment(int cno) throws Exception {
		// TODO 自动生成的方法存根
		int row=0;
		String sql="delect * from comment where cno = ?";
		row=DBUtil.executeUpdate(sql,cno);
		return (row!=0)?true:false;
	}

    @Override
    public boolean updateComment(int uid, boolean b) throws Exception {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public List<CommentBean> selectByFno(int fno) throws Exception {
        List<CommentBean> comment_list = new ArrayList<CommentBean>();
        String sql = "select * from comment where fno = ?";
        rs = DBUtil.executeQuery(sql, fno);
        while(rs.next()) {
            CommentBean comment = new CommentBean();
            comment.setCno(rs.getInt("cno"));
            comment.setContent(rs.getString("content"));
            comment.setCtime(rs.getTimestamp("ctime"));
            comment.setStatus(rs.getBoolean("status"));
            comment.setReplyno(rs.getInt("replyno"));
            comment.setComment(new CommentDaoImpl().selectByCno(rs.getInt("replyno")));
            comment.setUser(new UserDaoImpl().select(rs.getInt("uid")));
            comment_list.add(comment);
        }
        return comment_list;
    }
    
    @Override
    public CommentBean selectByCno(int cno) throws Exception {
        CommentBean comment = null;
        String sql = "select * from comment where cno = ?";
        rs = DBUtil.executeQuery(sql, cno);
        while(rs.next()) {
            comment = new CommentBean();
            comment.setCno(rs.getInt("cno"));
            comment.setContent(rs.getString("content"));
            comment.setCtime(rs.getTimestamp("ctime"));
            comment.setStatus(rs.getBoolean("status"));
            comment.setReplyno(rs.getInt("replyno"));
            comment.setComment(new CommentDaoImpl().selectByCno(rs.getInt("replyno")));
            comment.setUser(new UserDaoImpl().select(rs.getInt("uid")));
        }
        return comment;
    }
}
