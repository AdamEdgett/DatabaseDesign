Assignment
==========

### Given the relational model (schema.png), write statements that will accomplish the following using jdbc:

![](schema.png?raw=true)

1. Create the following entity classes
  1. User.java
  2. Movie.java
  3. Actor.java
  4. Comment.java
  5. Cast.java

2. Using javax.sql.DataSource fully implement data access classes for each of the entity classes
  1. UserManager.java
    1. void createUser(User newUser);
    2. List<User> readAllUsers();
    3. User readUser(String username);
    4. void updateUser(String username, User user);
    5. void deleteUser(String username);

  2. MovieManager.java
    1. void createMovie(Movie newMovie);
    2. List<Movie> readAllMovies();
    3. Movie readMovie(String movieId);
    4. void updateMovie(String movieId, Movie movie);
    5. void deleteMovie(String movieId);

  3. ActorManager.java
    1. void createActor(Actor newActor);
    2. List<Actor> readAllActors();
    3. Actor readActor(String actorId);
    4. void updateActor(String actorId, Actor actor);
    5. void deleteActor(String actorId);

3. Using javax.sql.DataSource fully implement data access classes for each of the association classes
  1. CommentManager.java
    1. void createComment(Comment newComment);
    2. List<Comment> readAllComments();
    3. List<Comment> readAllCommentsForUsername(String username);
    4. List<Comment> readAllCommentsForMovie(String movieId);
    5. Comment readCommentForId(String commentId);
    6. void updateComment(String commentId, String newComment);
    7. void deleteComment(String commentId);

  2. CastManager.java
    1. void createCast(Cast newCast);
    2. List<Cast> readAllCast();
    3. List<Cast> readAllCastForActor(String actorId);
    4. List<Cast> readAllCastForMovie(String movieId);
    5. Cast readCastForId(String castId);
    6. void updateCast(String castId, Cast newCast);
    7. void deleteCast(String castId);

