package dbd;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.List;

public class CastDao {
    private static EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("dbd");

    public void createCast(int actorId, int movieId, CastRole castRole) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Actor actor = em.find(Actor.class, actorId);
        Movie movie = em.find(Movie.class, movieId);
        castRole.setActorInMovie(actor);
        castRole.setMovieActedIn(movie);
        em.persist(castRole);
        em.getTransaction().commit();
        em.close();
    }

    public CastRole getCast(int castId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        CastRole castRole = em.find(CastRole.class, castId);
        em.getTransaction().commit();
        em.close();
        return castRole;
    }

    public List<CastRole> getCastForMovie(int movieId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Movie movie = em.find(Movie.class, movieId);
        Query query = em.createNamedQuery("Cast.getCastForMovie");
        query.setParameter("movieActedIn", movie);
        List<CastRole> castRoles = query.getResultList();
        em.getTransaction().commit();
        em.close();
        return castRoles;
    }

    public void changeCharacterForCast(int castId, String newCharacter) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        CastRole castRole = em.find(CastRole.class, castId);
        castRole.setCharacterName(newCharacter);
        em.merge(castRole);
        em.getTransaction().commit();
        em.close();
    }
}
