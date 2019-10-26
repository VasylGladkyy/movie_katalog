class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @movie = reviewable_movie
    @review = @movie.reviews.find(params[:id])
    authorize @review
  end

  def create
    @movie = reviewable_movie
    @review = @movie.reviews.new(review_params)
    authorize @review
    if @review.save
      flash[:success] = 'Review is saved!'
      redirect_to @movie
    else
      flash[:error] = 'Review is not saved :('
      redirect_to @movie
    end
  end

  def update
    @movie = reviewable_movie
    @review = @movie.reviews.find(params[:id])
    authorize @review
    if @review.update(review_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    @movie = reviewable_movie
    @review = @movie.reviews.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to @movie
  end

  protected

  def reviewable_movie
    Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:description, :rate).merge!(user_id: current_user.id)
  end
end
