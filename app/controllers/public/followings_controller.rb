class Public::FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @followings = @user.followings.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false).page(params[:page]).per(10)
  end
end
