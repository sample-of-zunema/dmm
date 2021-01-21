class FavoritesController < ApplicationController
  # いいね作成
  def create
    @dream = Dream.find(params[:dream_id])
    favorite = current_user.favorites.new(dream_id: @dream.id)
    favorite.save
  end

  # いいねの削除
  def destroy
    @dream = Dream.find(params[:dream_id])
    favorite = current_user.favorites.find_by(dream_id: @dream.id)
    favorite.destroy
  end
end
