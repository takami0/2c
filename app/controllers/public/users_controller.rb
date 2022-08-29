class Public::UsersController < ApplicationController
  def my_page
    # @medium = CategoryMedium.find(params[:id])
  end

  def quit
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end
end
