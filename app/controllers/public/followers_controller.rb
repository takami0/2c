class Public::FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers.display_users.page(params[:page]).per(10)
  end


end
