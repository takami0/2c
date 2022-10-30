class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :user_find, only:[:show, :edit, :update]

  def index
    @users = User.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @medium = CategoryMedium.find(@user.category_medium_id)
    @occupation = Occupation.find(@user.occupation_id)
    @posts = Post.all
  end

  def update
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  private
  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:valid_status)
  end

end
