class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def new
  end

  def create
  end

  def show
    @user = current_user
    @dream = Dream.find(params[:id])
    @dreams = Dream.all
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
