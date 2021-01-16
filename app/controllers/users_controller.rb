class UsersController < ApplicationController

  def new
  end

  def create
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @dreams = @user.dreams
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end

  end

  def unsubscribe
  end

  def withdraw
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end
