package dbd;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

public class ActorDao {
    private static EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("dbd");

    public void createActor(Actor actor) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        em.persist(actor);
        em.getTransaction().commit();
        em.close();
    }

    public List<Actor> getAllActors() {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Query query = em.createNamedQuery("Actor.getAll");
        List<Actor> actors = query.getResultList();
        em.getTransaction().commit();
        em.close();
        return actors;
    }

    public List<CastRole> getCastForActor(int actorId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Actor actor = em.find(Actor.class, actorId);
        List<CastRole> castRoles = actor.getMoviesIn();
        em.getTransaction().commit();
        em.close();

        return castRoles;
    }

    public List<Movie> getMoviesForActor(int actorId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Actor actor = em.find(Actor.class, actorId);

        Query query = em.createNamedQuery("Actor.getMoviesForActor");
        query.setParameter("actorInMovie", actor);
        List<Movie> movies = query.getResultList();
        em.getTransaction().commit();
        em.close();
        return movies;
    }
}
