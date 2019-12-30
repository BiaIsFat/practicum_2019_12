// UserBean.java
package bean;

import java.util.List;

public class UserBean {
    private int     uid;
    private String  sex;
    private String  uname;
    private String  upwd;
    private String  email;
    private String  uphone;
    private boolean vip;
    private boolean forbidden;
    private boolean nospeak;
    
    private List<OrderBean> order_list;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public boolean isVip() {
        return vip;
    }

    public void setVip(boolean vip) {
        this.vip = vip;
    }

    public boolean isForbidden() {
        return forbidden;
    }

    public void setForbidden(boolean forbidden) {
        this.forbidden = forbidden;
    }

    public boolean isNospeak() {
        return nospeak;
    }

    public void setNospeak(boolean nospeak) {
        this.nospeak = nospeak;
    }

    public List<OrderBean> getOrder_list() {
        return order_list;
    }

    public void setOrder_list(List<OrderBean> order_list) {
        this.order_list = order_list;
    }
    
    
}