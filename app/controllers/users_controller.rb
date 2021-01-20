class UsersController < ApplicationController

  def show
    @user = current_user
    @user = User.find(params[:id])
    @dreams = @user.dreams
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      redirect_to edit_user_registration_path
    end
  end

  def withdraw
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end
