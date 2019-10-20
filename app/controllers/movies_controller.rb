class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = movie
  end

  protected

  def movie
    Movie.find(params[:id])
  end
end
