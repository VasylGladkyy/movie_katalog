class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = user
    authorize @user
  end

  def edit
    @user = user
    authorize @user
  end

  def update
    @user = user
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  protected

  def user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :role)
  end
end