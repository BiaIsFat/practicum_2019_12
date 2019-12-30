package bean;

import java.util.Date;

public class CommentBean {
    private int     cno;
    private int     replyno;
    private Date    ctime;
    private String  content;
    private boolean status;
    
    private UserBean    user;
    private FilmBean    film;
    private CommentBean comment;
    
    public int getCno() {
        return cno;
    }
    public void setCno(int cno) {
        this.cno = cno;
    }
    public int getReplyno() {
        return replyno;
    }
    public void setReplyno(int replyno) {
        this.replyno = replyno;
    }
    public Date getCtime() {
        return ctime;
    }
    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public boolean isStatus() {
        return status;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
    public UserBean getUser() {
        return user;
    }
    public void setUser(UserBean user) {
        this.user = user;
    }
    public FilmBean getFilm() {
        return film;
    }
    public void setFilm(FilmBean film) {
        this.film = film;
    }
    public CommentBean getComment() {
        return comment;
    }
    public void setComment(CommentBean comment) {
        this.comment = comment;
    }
    
    
}
