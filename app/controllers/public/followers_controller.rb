class Public::FollowersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @followers = User.find(params[:user_id]).followers.page(params[:page]).per(10)
  end
end
