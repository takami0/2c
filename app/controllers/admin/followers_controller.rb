class Admin::FollowersController < ApplicationController
  def index
    @followers = User.find(params[:user_id]).followers.page(params[:page]).per(10)
  end
end
