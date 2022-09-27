class Public::UsersController < ApplicationController
  before_action :user_find, only:[:show, :edit, :update]

  def index
    @users = User.where(valid_status: true).where.not(display_status: false).page(params[:page]).per(10)
  end

  def show
    @medium = CategoryMedium.find(@user.category_medium_id)
    @occupation = Occupation.find(@user.occupation_id)
    @posts = Post.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to public_user_path(@user.id)
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
