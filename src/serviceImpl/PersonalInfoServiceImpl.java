// PersonalInfoServiceImpl.java
package serviceImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.CAdminBean;
import bean.CommentBean;
import bean.OrderBean;
import bean.PAdminBean;
import bean.UserBean;
import dao.CAdminDao;
import dao.CommentDao;
import dao.OrderDao;
import dao.PAdminDao;
import dao.UserDao;
import daoImpl.CAdminDaoImpl;
import daoImpl.CommentDaoImpl;
import daoImpl.OrderDaoImpl;
import daoImpl.PAdminDaoImpl;
import daoImpl.UserDaoImpl;
import service.PersonalInfoService;
import util.DBUtil;

public class PersonalInfoServiceImpl implements PersonalInfoService {

    private Connection conn;
    
    public PersonalInfoServiceImpl() {
        
    }

    @Override
    public int login(String uname, String pwd) {
        this.conn = DBUtil.getConn();
        UserBean user = null;
        UserDao userdao = new UserDaoImpl();
        int uid = 0;
        try {
            user = userdao.select(uname);
            // whether user exists or Password is not right
            if(user == null) {
                return -1;
            } else if(!user.getUpwd().equals(pwd)) {
                return 0;
            } else {
                uid = user.getUid();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return uid;
    }

    @Override
    public List<UserBean> findAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public UserBean findinfoBySelf(int uid) {
        this.conn = DBUtil.getConn();
        UserBean user = new UserBean();
        UserDao userdao = new UserDaoImpl();
        try {
            conn.setAutoCommit(false);
            user = userdao.select(uid);
            conn.commit();
            
        } catch (Exception e) {
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
        
        return user;
    }

    @Override
    public List<OrderBean> findorderByself(int uid) {
        List<OrderBean> order = new ArrayList<OrderBean>();
        conn = DBUtil.getConn();
        OrderDao orderdao=new OrderDaoImpl();
        try {
            conn.setAutoCommit(false);
            order = orderdao.selectByUid(uid);
            conn.commit();
            
        } catch (Exception e) {
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
        
        return order;
    }

    @Override
    public boolean changeInfo(int uid,String upwd, String phone, String sex, String email) {
        this.conn = DBUtil.getConn();
        boolean flag = false;
        UserDao user_dao = new UserDaoImpl();
        UserBean user = null;
        try {
            conn.setAutoCommit(false);
            user = user_dao.select(uid);
            flag = user_dao.updateUser(uid, upwd,phone, email, sex,user.isVip(), user.isForbidden(), user.isNospeak());
            
            conn.commit();
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return flag;
    }


    @Override
    public boolean changePwd(int uid, String pwd) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean beVip(int uid) {
        this.conn = DBUtil.getConn();
        boolean flag = false;
        
        try {
            conn.setAutoCommit(false);
            
            UserDao userdao = new UserDaoImpl();
            
            // Generate a User object by uid
            UserBean user = userdao.select(uid);
            // Change the VIP into true
            flag = userdao.updateUser(uid, user.getUpwd(), user.getUphone(), user.getEmail(),
                    user.getSex(), true, user.isForbidden(), user.isNospeak());
            
            conn.commit();
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return flag;
    }

    @Override
    public boolean signUp(String uname, String upwd, String uphone, String email, String sex) {
        this.conn = DBUtil.getConn();
        boolean flag = false;
        UserDao userdao = new UserDaoImpl();
        try {
            conn.setAutoCommit(flag);
            flag = userdao.addUser(uname, upwd, uphone, email, sex);
            conn.commit();
            
        } catch (Exception e) {
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
    public boolean signUp(UserBean user) {
        // TODO Auto-generated method stub
        return false;
    }
    
    @Override
    public boolean banUser(int uid) {
        // TODO 自动生成的方法存根
        return false;
    }

    @Override
    public boolean resetPwd(int uid) {
        // TODO 自动生成的方法存根
        return false;
    }

    @Override
    public boolean stopUser(int uid) {
        // TODO 自动生成的方法存根
        return false;
    }

    @Override
    public List<OrderBean> findAllOder() {
        // TODO 自动生成的方法存根
        return null;
    }

    @Override
    public OrderBean findByUid(int uid) {
        // TODO 自动生成的方法存根
        return null;
    }
    
    @Override
    public CAdminBean find_cadmin(String account) {
        // TODO 自动生成的方法存根
         this.conn = DBUtil.getConn();
            CAdminBean cadmin = new CAdminBean();
            CAdminDao cadmin_dao = new CAdminDaoImpl();
            try {
                conn.setAutoCommit(false);
                cadmin = cadmin_dao.select(account);
                conn.commit();
                
            } catch (Exception e) {
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
            
            return cadmin;
    }
//12.25
    @Override
    public int cadmin_login(String account,String pwd) {
        // TODO 自动生成的方法存根
        this.conn = DBUtil.getConn();
        CAdminBean cadmin_bean = null;
        CAdminDao cad_dao = new CAdminDaoImpl();
        int uid = 0;
        try {
            cadmin_bean = cad_dao.select(account);
            // whether user exists or Password is not right
            if(cadmin_bean == null) {
                return -1;
            } else if(!cadmin_bean.getPwd().equals(pwd)) {
                return 0;
            } else {
                uid = cadmin_bean.getUid();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        
        return uid;
    } 
    
    @Override
    public boolean comment(String content, int uid, int replyno,int fno) {
        // TODO 自动生成的方法存根
          this.conn = DBUtil.getConn();
            boolean flag = false;
            CommentDao comment = new CommentDaoImpl();
            SimpleDateFormat gs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String ctime=gs.format(new Date());
            try {
                conn.setAutoCommit(false);         
                

                flag = comment.addComment(content,ctime,replyno,uid,fno);
                
                conn.commit();
            } catch (Exception e) {
                try {
                    conn.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
                e.printStackTrace();
            } finally {
                DBUtil.close();
            }
            return flag;
    }

    @Override
    public List<CommentBean> findCommentByself(int uid) {
        // TODO 自动生成的方法存根
         List<CommentBean> comment = null;
            CommentDao comment_dao=new CommentDaoImpl();
            try {
                conn.setAutoCommit(false);
                 comment= comment_dao.select(uid);
                conn.commit();
                
            } catch (Exception e) {
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
            
            return comment;
    }

    @Override
    public boolean delcomment(int uid) {
        // TODO 自动生成的方法存根
        this.conn = DBUtil.getConn();
        boolean flag = false;
        CommentDao comment = new CommentDaoImpl();
       
        try {
            conn.setAutoCommit(false);         
            // Generate a User object by uid
            // Change the VIP into true
            flag = comment.updateComment(uid,false);
            
            conn.commit();
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return flag;

    }

    @Override
    public int padmin_login(String account, String pwd) {
     // TODO 自动生成的方法存根
        this.conn = DBUtil.getConn();
        PAdminBean padmin_bean = null;
        PAdminDao pad_dao = new PAdminDaoImpl();
        int uid = 0;
        try {
            padmin_bean = pad_dao.select(account);
            // whether user exists or Password is not right
            if(padmin_bean == null) {
                return -1;
            } else if(!padmin_bean.getPwd().equals(pwd)) {
                return 0;
            } else {
                uid = 2;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        
        return uid;
    } 
    
    @Override
    public PAdminBean find_padmin(String account) {
        // TODO 自动生成的方法存根
         this.conn = DBUtil.getConn();
         PAdminBean padmin = new PAdminBean();
         PAdminDao padmin_dao = new PAdminDaoImpl();
         try {
             conn.setAutoCommit(false);
             padmin = padmin_dao.select(account);
             conn.commit();
             
         } catch (Exception e) {
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
         
         return padmin;
    }

    @Override
    public List<CommentBean> findCommentByFilm(int fno) {
        this.conn = DBUtil.getConn();
        CommentDao comment_dao = new CommentDaoImpl();
        List<CommentBean> comment_list = null;
        try {
            comment_list = comment_dao.selectByFno(fno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return comment_list;
    } 
    
}
