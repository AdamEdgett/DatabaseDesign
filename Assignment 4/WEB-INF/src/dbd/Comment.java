package dbd;

import java.util.Date;

public class Comment {
    Integer id;
    String comment;
    Date date;
    Integer userId;

    public Comment() {}
    public Comment(Integer id, String comment, Date date, Integer userId) {
        this.id = id;
        this.comment = comment;
        this.date = date;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
