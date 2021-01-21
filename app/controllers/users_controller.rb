class UsersController < ApplicationController
  # マイページ
  def show
    @user = current_user
    @user = User.find(params[:id])
    @dreams = @user.dreams
  end

  # 退会ページ
  def withdraw; end

end
