class MoviesController < ApplicationController
  def index
    #/movies?search_qury_=user_input
    # rails set url params
    @movies = Movie.all
    #OmdbCLient.instance.all
    #
    # if params[:search_query].present?
    # @movies_from_api = OmdbClient.instance.search(params[:search_query])
    # end
    #
    # @movies=Movie.all
    # add IMDb to db
  end

  def show
    @movie = movie
  end

  def search_api
    @movies_from_api = OmdbClient.instance.search(params[:search_auery])
  end
  protected

  def movie
    Movie.find(params[:id])
  end
  
  def refresh_movies
    Movie.all.pluck(:imdb_id).each do |id|
      movie = OmdbClient.instance_search(i: id)
    end
  end
  
  def create_review
    #Find movie by imdb id unical
    # if movie exist
    #  Review.new(revie_params.merge(revieable: movie)).save
    # else
    # Movie.new(params[:movie_params])
    # end
    #
    # Review.new(revie_params)
    #
    # Moviesparams[:imdb_id]
    #
  end
end
