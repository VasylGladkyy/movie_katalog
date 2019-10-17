class UsersController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @users = users
    authorize @users
  end

  def show
    @user = user
    authorize @user
  end

  def edit
    #Todo
  end
  
  protected
  
  def users
    User.all
  end
  
  def user
    User.find(params[:id])
  end
end