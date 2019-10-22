class MoviesController < ApplicationController
  def index
    @movies = Movie.search(title: params[:title])
  end

  def show
    @movie = movie
  end

  protected

  def movie
    Movie.find(params[:id])
  end
end
