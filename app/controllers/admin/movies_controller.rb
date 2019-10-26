class Admin::MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = search_by_title
    authorize user
  end

  def new
    @movie = odb_client.by_id(id: params[:imdbID])
    authorize user
  end

  def create
    @movie = Movie.new(movie_params)
    authorize user
    if @movie.save
      redirect_to @movie
    else
      redirect_to @movie
    end
  end

  def refresh
    authorize user
    if ScheduledMoviesRefresherJob.new.perform_now
      flash[:success] = 'Movies start updated'
      redirect_to root_path
    else
      flash[:error] = 'Movies haven\'t start updating'
    end
  end

  private

  def movie
    Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :ganre, :release_date, :director, :actors, :plot, :metascore, :imdbRating, :imdb_id, :poster_url)
  end

  def odb_client
    OmdbClient.instance
  end

  def user
    current_user
  end

  def search_by_title
    title = params[:title]
    odb_client.by_title_all(title: title) if title
  end
end
