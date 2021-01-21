class CommentsController < ApplicationController
  # コメントの新規作成
  def create
    @dream = Dream.find(params[:dream_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.dream_id = @dream.id
    @comment.save
    @comments = @dream.comments
    @user = @dream.user
  end

  # コメントの削除
  def destroy
    Comment.find_by(id: params[:id], dream_id: params[:dream_id]).destroy
    @dream = Dream.find(params[:dream_id])
    @comments = @dream.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :dream_id, :user_id, :comment)
  end
end
