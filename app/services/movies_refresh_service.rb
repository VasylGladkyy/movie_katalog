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
    @omdb_movies.each do |hash|
      movie = Movie.find_by(title: hash['Title'])
      movie.update(title: hash['Title'],
                   ganre: hash['Genre'],
                   release_date: hash['Released'],
                   director: hash['Director'],
                   actors: hash['Actors'],
                   plot: hash['Plot'],
                   metascore: hash['Metascore'],
                   imdbRating: hash['imdbRating'],
                   imdb_id: hash['imdbID'])
    end
  end
end
