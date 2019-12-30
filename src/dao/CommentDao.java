package dao;

import java.util.List;

import bean.CommentBean;

public interface CommentDao {
    // Select comments by user's id
    List<CommentBean> select(int uid) throws Exception;
    
    // Add a new comment
    boolean addComment(String content, String ctime, int replyno, int uid, int fno) throws Exception;
    
    // Delete a comment
    boolean delComment(int cno) throws Exception;

    boolean updateComment(int uid, boolean b) throws Exception;

    List<CommentBean> selectByFno(int fno) throws Exception;
    
    CommentBean selectByCno(int cno) throws Exception; 
 
}
