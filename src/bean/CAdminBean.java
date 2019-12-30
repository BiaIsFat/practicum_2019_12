package bean;

public class CAdminBean {
    private int    uid;
    private String account;
    private String pwd;
    
    private CinemaBean cinema;
    
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public CinemaBean getCinema() {
        return cinema;
    }

    public void setCinema(CinemaBean cinema) {
        this.cinema = cinema;
    }
    
    
}
