class DreamsController < ApplicationController

  def top
  end

  def new
    @dream = Dream.new
  end

  def create
    dream = Dream.new(dream_params)
    dream.save
    redirect_to dream_path(:id)
  end

  def index
    @dreams = Dream.all
  end

  def show
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
  end

  private
  def dream_params
    params.require(:dream).permit(:day, :emotion, :title, :body)
  end

end
