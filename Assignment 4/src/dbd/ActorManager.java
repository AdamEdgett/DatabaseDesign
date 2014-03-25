package dbd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ActorManager {
    DataSource ds;
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet results = null;

    String readAllActors = "SELECT * FROM Actor";
    String createActor = "INSERT INTO Actor" +
            "(id, firstName, lastName, dateOfBirth) VALUES (?, ?, ?, ?)";
    String readActor = "SELECT * FROM Actor WHERE id=?";
    String updateActor = "UPDATE Actor SET id=?, firstName=?, lastName=?, dateOfBirth=? WHERE id=?";
    String deleteActor = "DELETE FROM Actor WHERE id=?";

    public ActorManager() {
        try {
            Context jndi = new InitialContext();
            ds = (DataSource) jndi.lookup("java:comp/env/jdbc/dbd");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public void createActor(Actor newActor) {
        try {
            connection = ds.getConnection();
            statement = connection.prepareStatement(createActor);
            statement.setObject(1, newActor.getId());
            statement.setString(2, newActor.getFirstName());
            statement.setString(3, newActor.getLastName());
            statement.setDate(4, new Date(newActor.getDateOfBirth().getTime()));
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Actor> readAllActors() {
        List<Actor> actors = new ArrayList<Actor>();

        try {
            connection = ds.getConnection();
            statement = connection.prepareStatement(readAllActors);
            results = statement.executeQuery();
            while (results.next()) {
                Actor actor = new Actor(
                        results.getInt("id"),
                        results.getString("firstName"),
                        results.getString("lastName"),
                        results.getDate("dateOfBirth")
                );
                actors.add(actor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return actors;
    }

    public Actor readActor(Integer actorId) {
        try {
            connection = ds.getConnection();
            statement = connection.prepareStatement(readActor);
            statement.setInt(1, actorId);
            results = statement.executeQuery();
            if (results.next()) {
                return new Actor(
                        results.getInt("id"),
                        results.getString("firstName"),
                        results.getString("lastName"),
                        results.getDate("dateOfBirth")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    public void updateActor(Integer actorId, Actor actor) {
        try {
            connection = ds.getConnection();
            statement = connection.prepareStatement(updateActor);
            statement.setInt(1, actor.getId());
            statement.setString(2, actor.getFirstName());
            statement.setString(3, actor.getLastName());
            statement.setDate(4, new Date(actor.getDateOfBirth().getTime()));
            statement.setInt(5, actorId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteActor(Integer actorId) {
        try {
            connection = ds.getConnection();
            statement = connection.prepareStatement(deleteActor);
            statement.setInt(1, actorId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
