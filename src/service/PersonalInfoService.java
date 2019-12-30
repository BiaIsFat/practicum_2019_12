// PersonalInfoService.java
package service;

import java.util.List;

import bean.*;

public interface PersonalInfoService {
    
    int login(String uname, String pwd);
    
    List<UserBean> findAll();
    
    UserBean findinfoBySelf(int uid);
    
    List<OrderBean> findorderByself(int uid);//查看 自己订单
    
    boolean signUp(UserBean user);
    
    boolean changePwd(int uid,String pwd);
    
    boolean beVip(int uid);

    boolean signUp(String uname, String upwd, String uphone, String email, String sex);

    boolean banUser(int uid);

    boolean resetPwd(int uid);

    boolean stopUser(int uid);

    List<OrderBean> findAllOder();

    OrderBean findByUid(int uid);

    boolean changeInfo(int uid, String upwd, String phone, String sex, String email);

    CAdminBean find_cadmin(String account);

    int cadmin_login(String account, String pwd);

    boolean comment(String content, int uid, int replyno, int fno);

    List<CommentBean> findCommentByself(int uid);

    boolean delcomment(int uid);

    int padmin_login(String account, String pwd);

    PAdminBean find_padmin(String account);

    List<CommentBean> findCommentByFilm(int fno);
}