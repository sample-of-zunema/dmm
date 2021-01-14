class DreamsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def top
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = current_user.id
    if @dream.save
      redirect_to dream_path(@dream.id)
    else
      @dream = Dream.new(dream_params)
      @dream.user_id = current_user.id
      render :new
    end
  end

  def index
    @dreams = Dream.all
  end

  def show
    @dream = Dream.find(params[:id])
    @user = @dream.user
    @comment = Comment.new
  end

  def edit
    @dream = Dream.find(params[:id])
    @user = @dream.user
    if @dream.user != current_user
      redirect_to dreams_path
    end
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update(dream_params)
      redirect_to dream_path(@dream.id)
    else
      @dream = dream
      render :edit
    end
  end

  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy
    redirect_to dreams_path
  end

  private
  def dream_params
    params.require(:dream).permit(:user_id, :day, :emotion, :title, :body, :start_time)
  end

end
