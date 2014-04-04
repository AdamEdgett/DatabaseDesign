package dbd;

import javax.persistence.*;

@Entity
@NamedQuery(name="Cast.getCastForMovie",
        query="SELECT c FROM CastRole c WHERE c.movieActedIn = :movieActedIn")
// Renamed Cast to CastRole due to issues with SQL table name
public class CastRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String characterName;

    @ManyToOne
    @JoinColumn
    private Actor actorInMovie;

    @ManyToOne
    @JoinColumn
    private Movie movieActedIn;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCharacterName() {
        return characterName;
    }

    public void setCharacterName(String character) {
        this.characterName = character;
    }

    public Actor getActorInMovie() {
        return actorInMovie;
    }

    public void setActorInMovie(Actor actorInMovie) {
        this.actorInMovie = actorInMovie;
    }

    public Movie getMovieActedIn() {
        return movieActedIn;
    }

    public void setMovieActedIn(Movie movieActedIn) {
        this.movieActedIn = movieActedIn;
    }
}
