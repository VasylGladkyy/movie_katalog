class Admin::MoviesController < ApplicationController
  def index
    @movie = search_by_title
    # @movies = Movie.all
    # authorize [:admin, @movies]
  end

  def create
    @movie = Movie.new(movie_params)
    # authorize [:admin, @movie]
    if @movie.save
      flash[:success] = 'Movie is saved!'
      redirect_to root_path
    else
      flash[:error] = 'Movie is not saved :('
      redirect_to @movie
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :ganre, :release_date, :director, :actors, :plot, :metascore, :imdbRating, :imdb_id)
  end

  def odb_client
    OmdbClient.instance
  end

  def search_by_title
    get_params = params[:title]
    odb_client.by_title(title: get_params) if get_params
  end
end
