class Public::FollowingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @followings = User.find(params[:user_id]).followings.page(params[:page]).per(10)
  end
end
