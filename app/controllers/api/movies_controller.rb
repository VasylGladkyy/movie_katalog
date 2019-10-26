# frozen_string_literal: true

class Api::MoviesController < Api::BaseController
  def index
    record_responce(Movie.all, 200)
  end

  def show
    record_responce(movie)
  end

  def new
    record_responce(Movie.new, 200)
  end

  def edit
    record_responce(movie, 200)
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      head :created
    else
      head :bad_reguest
    end
  end

  def update
    if movie.update(movie_params)
      head :updated
    else
      head :bad_reguest
    end
  end

  def destroy
    movie.destroy
    head :no_content
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :ganre, :release_date, :director, :actors, :plot, :metascore, :imdbRating, :imdb_id, :poster_url)
  end

  def movie
    Movie.find(params[:id])
  end
end
