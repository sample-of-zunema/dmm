class CommentsController < ApplicationController

  def create
    dream = Dream.find(params[:dream_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.dream_id = dream.id
    comment.save
    redirect_to dream_path(dream)
  end

  def destroy
    Comment.find_by(id: params[:id], dream_id: params[:dream_id]).destroy
    redirect_to dream_path(params[:dream_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
