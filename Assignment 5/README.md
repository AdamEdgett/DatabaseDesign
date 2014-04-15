JPA
==========

### Given the relational model, write statements that will accomplish the following using jpa:

![](schema.png?raw=true)

1. Create the following entity classes
  1. User.java
  2. Movie.java
  3. Actor.java
  4. Comment.java
  5. Cast.java

2. Using JPA fully implement a data access object that implements the following methods
  1. User
    1. void createUser(User newUser);
    2. List<Review> getReviewsForUser(int userId);
    3. void addReviewForMovie(int userId, int movieId, Comment comment);

  2. Movie
    1. List<Movie> listAllMovies();
    2. List<Review> getReviewsForMovie(int movieId);
    3. List<Cast> getCastForMovie(int movieId);

  3. Actor
    1. void createActor(Actor newActor);
    2. List<Actor> getAllActors();
    3. List<Cast> getCastForActor(int actorId);
    4. List<Movie> getMoviesForActor(int actorId);

  4. Comment
    1. void createComment(int userId, int movieId, Comment comment);
    2. Comment getComment(commentId);
    3. void updateComment(int commentId, Comment comment);
    4. void deleteComment(int commentId);

  5. Cast
    1. void createCast(int actorId, int movieId, Cast cast);
    2. Cast getCast(int castId);
    3. List<Cast> getCastForMovie(int movieId);
    4. void changeCharacterForCast(int castId, String newCharacter);
