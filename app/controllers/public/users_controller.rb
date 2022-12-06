class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :user_find, only:[:show, :edit, :update]

  def index
    display_users = User.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false)
    @display_users = display_users.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @medium = CategoryMedium.find(@user.category_medium_id)
    @occupation = Occupation.find(@user.occupation_id)
    @followings = @user.followings.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false)
    @followers = @user.followers.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false)
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
  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :icon, :address, :occupation_id, :category_medium_id, :introduction, :display_status)
  end

end
