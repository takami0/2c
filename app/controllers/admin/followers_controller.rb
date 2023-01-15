class Admin::FollowersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers.page(params[:page]).per(10)
  end
end
