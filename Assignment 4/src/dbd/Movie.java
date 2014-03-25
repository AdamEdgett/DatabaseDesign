package dbd;

import java.util.Date;

public class Movie {
    Integer id;
    String title;
    String posterImage;
    Date releaseDate;

    public Movie() {}

    public Movie(Integer id, String title,
                 String posterImage, Date releaseDate) {
        this.id = id;
        this.title = title;
        this.posterImage = posterImage;
        this.releaseDate = releaseDate;
    }

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
}
