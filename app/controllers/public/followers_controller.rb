class Public::FollowersController < ApplicationController
  def index
    @followers = User.find(params[:follow_user_id]).followers
  end
end
