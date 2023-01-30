class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :user_find, only:[:show, :edit, :update]
  before_action :authentication_of_access, only:[:edit, :update]

  def index
    @display_users = User.display_users.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @medium = CategoryMedium.find(@user.category_medium_id)
    @occupation = Occupation.find(@user.occupation_id)
    @followings = @user.followings.display_users
    @followers = @user.followers.display_users
    @posts = Post.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  # <berore_actionメソッド>
  def user_find
    @user = User.find(params[:id])
  end

  def authentication_of_access
    @user = User.find(params[:id])
    redirect_to new_user_session_path unless @user.id == current_user.id
  end
  # </berore_actionメソッド>

  def user_params
    params.require(:user).permit(:name, :icon, :address, :occupation_id, :category_medium_id, :introduction, :display_status)
  end

end
