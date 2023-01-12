class Admin::FollowingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.find(params[:user_id])
    @followings = @user.followings.page(params[:page]).per(10)
  end
end
