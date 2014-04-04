package dbd;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

public class MovieDao {
    private static EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("dbd");

    @SuppressWarnings("unchecked")
    public List<Movie> listAllMovies() {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Query query = em.createNamedQuery("Movie.getAll");
        List<Movie> movies = query.getResultList();
        em.getTransaction().commit();
        em.close();
        return movies;
    }

    @SuppressWarnings("unchecked")
    public List<Comment> getCommentsForMovie(int movieId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Movie movie = em.find(Movie.class, movieId);
        Query query = em.createNamedQuery("Movie.getCommentsForMovie");
        query.setParameter("movieReviewed", movie);
        List<Comment> comments = query.getResultList();
        em.getTransaction().commit();
        em.close();
        return comments;
    }

    @SuppressWarnings("unchecked")
    public List<CastRole> getCastForMovie(int movieId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Movie movie = em.find(Movie.class, movieId);
        Query query = em.createNamedQuery("Movie.getCastForMovie");
        query.setParameter("movieActedIn", movie);
        List<CastRole> castRoles = query.getResultList();
        em.getTransaction().commit();
        em.close();
        return castRoles;
    }
}
