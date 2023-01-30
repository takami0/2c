class Public::FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @followings = @user.followings.display_users.page(params[:page]).per(10)
  end
end
