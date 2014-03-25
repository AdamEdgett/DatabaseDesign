package dbd;

public class Cast {
    Integer id;
    String characterName;
    Integer movieId;
    Integer actorId;

    public Cast() {}

    public Cast(Integer id, String characterName,
                Integer movieId, Integer actorId) {
        this.id = id;
        this.characterName = characterName;
        this.movieId = movieId;
        this.actorId = actorId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCharacterName() {
        return characterName;
    }

    public void setCharacterName(String characterName) {
        this.characterName = characterName;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Integer getActorId() {
        return actorId;
    }

    public void setActorId(Integer actorId) {
        this.actorId = actorId;
    }
}
