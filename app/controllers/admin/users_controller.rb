class Admin::UsersController < ApplicationController
  before_action :user_find, only:[:show, :edit, :update]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @medium = CategoryMedium.find(@user.category_medium_id)
    @occupation = Occupation.find(@user.occupation_id)
    @posts = Post.all
  end

  def update
    @user.update!(
      if @user.valid_status == true
        (params[:valid_status => false ])
      else
        (params[:valid_status => true ])
      end
    )
    redirect_to admin_user_path(@user.id)
  end

  private
  def user_find
    @user = User.find(params[:id])
  end

end
