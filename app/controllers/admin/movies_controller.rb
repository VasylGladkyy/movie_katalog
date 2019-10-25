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
      redirect_to @movie
    else
      redirect_to @movie
    end
  end
  #Putch
  def refresh_movies
  
    #ScheduledMoviesRefresherJob.perform_later
    # 1 Call worker
    # 2 notrify user
    # Асинхронна кнопка -адмін натискає кнопку сторінка не перезагружається
    # sidekig work!
    # user has many
    # active record
    # association table
    # user has many movies
    # movies has many movies
    # асинхронно кнопка
    
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
