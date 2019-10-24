class Api::MoviesController < Api::BaseController
  def index
    # render json: {message: "Hello world"}, status: 200
    record_responce(Movie.all , 200)
  end
  
  def show
  
  end
  
  def new
  
  end
  
  def create
  
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def destroy
  
  end
  
end
