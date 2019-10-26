class MoviesRefreshService
  attr_reader :omdb_client, :omdb_ids, :omdb_movies

  def initialize
    @omdb_client = OmdbClient.instance
    @omdb_ids = nil
    @omdb_movies = nil
  end

  def call
    prepare_imdb_ids
    fetch_ombd_movies
    update_movies_atributes
  end

  private

  def prepare_imdb_ids
    @omdb_ids = Movie.all.pluck(:imdb_id)
  end

  def fetch_ombd_movies
    @omdb_movies = @omdb_ids.map do |id|
      @omdb_client.by_id(id: id)
    end
  end

  def update_movies_atributes
    movies = @omdb_movies
    movies.each do |movie|
      movie = Movie.find_by(imdb_id: movie['imdbID'])
      movie.poster_image.purge
      movie.update(title: movie['Title'],
                   ganre: movie['Genre'],
                   release_date: movie['Released'],
                   director: movie['Director'],
                   actors: movie['Actors'],
                   imdbRating: movie['imdbRating'],
                   metascore: movie['Metascore'],
                   plot: movie['Plot'],
                   poster_url: movie['Poster'])
    end
  end
end
