class Public::FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    followers = User.find(params[:user_id]).followers
    @followers = followers.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false).page(params[:page]).per(10)
  end

end
