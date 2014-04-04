package dbd;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String comment;

    private Integer stars;

    @Temporal(TemporalType.DATE)
    private Date dateCommented;

    @ManyToOne
    @JoinColumn
    private Movie movieReviewed;

    @ManyToOne
    @JoinColumn
    private User reviewer;

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

    public Integer getStars() {
        return stars;
    }

    public void setStars(Integer stars) {
        this.stars = stars;
    }

    public Date getDateCommented() {
        return dateCommented;
    }

    public void setDateCommented(Date dateCommented) {
        this.dateCommented = dateCommented;
    }

    public Movie getMovieReviewed() {
        return movieReviewed;
    }

    public void setMovieReviewed(Movie movieReviewed) {
        this.movieReviewed = movieReviewed;
    }

    public User getReviewer() {
        return reviewer;
    }

    public void setReviewer(User reviewer) {
        this.reviewer = reviewer;
    }
}
