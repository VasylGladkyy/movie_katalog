# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @review = reviewable_movie.reviews.new(review_params)
    if @review.save
      flash[:success] = 'Review is saved!'
      redirect_to reviewable_movie
    else
      flash[:error] = 'Review is not saved :('
      redirect_to reviewable_movie
    end
  end

  protected

  def reviewable_movie
    Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:description, :rate).merge!(user_id: current_user.id)
  end
end
