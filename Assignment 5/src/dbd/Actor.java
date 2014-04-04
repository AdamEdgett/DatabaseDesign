package dbd;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@NamedQueries({
        @NamedQuery(name="Actor.getAll", query="SELECT a FROM Actor a"),
        @NamedQuery(name="Actor.getMoviesForActor",
        query="SELECT m FROM CastRole c JOIN c.movieActedIn m WHERE c.actorInMovie = :actorInMovie")
})

public class Actor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String firstName;

    private String lastName;

    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;

    @OneToMany(mappedBy= "actorInMovie")
    private List<CastRole> moviesIn;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public List<CastRole> getMoviesIn() {
        return moviesIn;
    }

    public void setMoviesIn(List<CastRole> moviesIn) {
        this.moviesIn = moviesIn;
    }
}
