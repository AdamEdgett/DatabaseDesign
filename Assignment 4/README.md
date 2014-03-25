Assignment
==========

### Given the relational model, write statements that will accomplish the following using jdbc:

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
    3. Movie readMovie(Integer movieId);
    4. void updateMovie(Integer movieId, Movie movie);
    5. void deleteMovie(Integer movieId);

  3. ActorManager.java
    1. void createActor(Actor newActor);
    2. List<Actor> readAllActors();
    3. Actor readActor(Integer actorId);
    4. void updateActor(Integer actorId, Actor actor);
    5. void deleteActor(Integer actorId);

3. Using javax.sql.DataSource fully implement data access classes for each of the association classes
  1. CommentManager.java
    1. void createComment(Comment newComment);
    2. List<Comment> readAllComments();
    3. List<Comment> readAllCommentsForUsername(String username);
    4. List<Comment> readAllCommentsForMovie(Integer movieId);
    5. Comment readCommentForId(Integer commentId);
    6. void updateComment(Integer commentId, String newComment);
    7. void deleteComment(Integer commentId);

  2. CastManager.java
    1. void createCast(Cast newCast);
    2. List<Cast> readAllCast();
    3. List<Cast> readAllCastForActor(Integer actorId);
    4. List<Cast> readAllCastForMovie(Integer movieId);
    5. Cast readCastForId(Integer castId);
    6. void updateCast(Integer castId, Cast newCast);
    7. void deleteCast(Integer castId);

