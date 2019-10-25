class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_watch_later]

  def index
    @movies = Movie.search(title: params[:title])
  end

  def show
    @movie = movie
  end

  def add_to_watch_later
    @movie = movie
    if current_user.save_movie?(movie: @movie)
      flash[:success] = 'Movie added to later watch list'
    else
      flash[:error] = 'Added movie is present in watch later list!'
    end
    redirect_to @movie
  end

  protected

  def movie
    Movie.find(params[:id])
  end
end
