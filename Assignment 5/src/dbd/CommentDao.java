package dbd;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CommentDao {
    private static EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("dbd");

    void createComment(int userId, int movieId, Comment comment) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        User user = em.find(User.class, userId);
        Movie movie = em.find(Movie.class, movieId);
        comment.setReviewer(user);
        comment.setMovieReviewed(movie);
        em.persist(comment);
        em.getTransaction().commit();
        em.close();
    }

    Comment getComment(int commentId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Comment comment = em.find(Comment.class, commentId);
        em.getTransaction().commit();
        em.close();
        return comment;
    }

    void updateComment(Comment comment) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        em.merge(comment);
        em.getTransaction().commit();
        em.close();
    }

    void deleteComment(int commentId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Comment comment = em.find(Comment.class, commentId);
        em.remove(comment);
        em.getTransaction().commit();
        em.close();
    }
}
