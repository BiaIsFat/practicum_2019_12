/*
 * 电影类
 */
package bean;

import java.util.Date;
import java.util.List;

public class FilmBean {
    private int     fno;
    private int     duration;
    private Date    ontime;
    private String  fname;
    private String  intro;
    private String  type;
    private String  actor;
    private String  pic;
    private String  country;
    private String  view;
    private boolean forbidden = false;  // available by default
    
    // assigned from view
    private double grades;  
    private double boxoffice;
    private double occupancy;

    
    private List<CommentBean> comment_list;
    private List<SessionBean> session_list;
    
    public FilmBean() {
        super();
        // TODO Auto-generated constructor stub
    }

    public List<CommentBean> getComment_list() {
        return comment_list;
    }

    public double getGrades() {
        return grades;
    }

    public void setGrades(double grades) {
        this.grades = grades;
    }

    public void setComment_list(List<CommentBean> comment_list) {
        this.comment_list = comment_list;
    }

    public List<SessionBean> getSession_list() {
        return session_list;
    }

    public void setSession_list(List<SessionBean> session_list) {
        this.session_list = session_list;
    }

    public int getFno() {
        return fno;
    }

    public void setFno(int fno) {
        this.fno = fno;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Date getOntime() {
        return ontime;
    }

    public void setOntime(Date ontime) {
        this.ontime = ontime;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }

    public boolean isForbidden() {
        return forbidden;
    }

    public void setForbidden(boolean forbidden) {
        this.forbidden = forbidden;
    }

    public double getBoxoffice() {
        return boxoffice;
    }

    public void setBoxoffice(double boxoffice) {
        this.boxoffice = boxoffice;
    }

    public double getOccupancy() {
        return occupancy;
    }

    public void setOccupancy(double occupancy) {
        this.occupancy = occupancy;
    }
    
    
}
