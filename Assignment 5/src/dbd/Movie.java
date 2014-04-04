package dbd;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@NamedQueries({
        @NamedQuery(name="Movie.getAll", query="SELECT m FROM Movie m"),
        @NamedQuery(name="Movie.getCommentsForMovie",
                    query="SELECT c FROM Comment c WHERE c.movieReviewed = :movieReviewed"),
        @NamedQuery(name="Movie.getCastForMovie",
                    query="SELECT c FROM CastRole c WHERE c.movieActedIn = :movieActedIn")
})
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;

    private String posterImage;

    @Temporal(TemporalType.DATE)
    private Date releaseDate;

    @OneToMany(mappedBy= "movieActedIn")
    private List<CastRole> castRoles;

    @OneToMany(mappedBy= "movieReviewed")
    private List<Comment> comments;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPosterImage() {
        return posterImage;
    }

    public void setPosterImage(String posterImage) {
        this.posterImage = posterImage;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public List<CastRole> getCastRoles() {
        return castRoles;
    }

    public void setCastRoles(List<CastRole> castRoles) {
        this.castRoles = castRoles;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
