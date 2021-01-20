class UsersController < ApplicationController

  # マイページ
  def show
    @user = current_user
    @user = User.find(params[:id])
    @dreams = @user.dreams
  end

  # 会員情報編集
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # OK。マイページへ
      redirect_to @user
    else
      # NG。編集ページの再表示
      redirect_to edit_user_registration_path
    end
  end

  # 退会ページ
  def withdraw
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end
