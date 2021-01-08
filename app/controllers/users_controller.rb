class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def new
  end

  def create
  end

  def show
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
