class Public::FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :pre_set, only:[:create, :destroy]

  def create
    follow = current_user.user_relationships.new(follow_user_id: params[:user_id])
    notice_follow = current_user.send_notifications.new(
        send_user_id: current_user.id,
        received_user_id: params[:user_id],
        action: "follow"
        )
    respond_to do |format|
      if follow.save
        format.html { redirect_to user_path(params[:user_id]) }
        format.js
        notice_follow.save
      end
    end
  end

  def destroy
    follow = current_user.user_relationships.find_by(follow_user_id: params[:user_id])
    follow_notice = current_user.send_notifications.find_by(received_user_id: params[:user_id], action: "follow")
    respond_to do |format|
      if follow.destroy
        format.html { redirect_to user_path(params[:user_id]) }
        format.js
        follow_notice.destroy
      end
    end
  end

  private
  def pre_set
    @user = User.find(params[:user_id])
    @followers = @user.followers.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false)
  end

end
