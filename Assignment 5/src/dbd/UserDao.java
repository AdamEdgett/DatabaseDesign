package dbd;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

public class UserDao {
    private static EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("dbd");

    void createUser(User newUser) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        em.persist(newUser);
        em.getTransaction().commit();
        em.close();
    }

    List<Comment> getCommentsForUser(int userId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        User user = em.find(User.class, userId);
        Query query = em.createNamedQuery("User.getCommentsForUser");
        query.setParameter("reviewer", user);
        List<Comment> comments = query.getResultList();
        em.getTransaction().commit();
        em.close();
        return comments;
    }

    void addReviewForMovie(int userId, int movieId, Comment comment) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        User user = em.find(User.class, userId);
        Movie movie = em.find(Movie.class, movieId);
        comment.setMovieReviewed(movie);
        comment.setReviewer(user);
        em.merge(comment);
        em.getTransaction().commit();
        em.close();
    }
}