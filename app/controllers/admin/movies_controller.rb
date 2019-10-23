class Admin::MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = search_by_title
    authorize current_user
  end

  def new
    @movie = odb_client.by_id(id: params[:imdbID])
    authorize current_user
  end

  def create
    @movie = Movie.new(movie_params)
    authorize current_user
    if @movie.save
      redirect_to root_path
    else
      redirect_to @movie
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

  def search_by_title
    title = params[:title]
    odb_client.by_title_all(title: title) if title
  end
end
