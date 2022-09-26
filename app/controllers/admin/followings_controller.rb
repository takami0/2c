class Admin::FollowingsController < ApplicationController
  def index
    @followings = User.find(params[:user_id]).followings.page(params[:page]).per(10)
  end
end
