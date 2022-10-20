class Public::FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    follow = current_user.user_relationships.new(follow_user_id: params[:user_id])
    follow_notice = current_user.send_notifications.new(
        send_user_id: current_user.id,
        received_user_id: params[:user_id],
        action: "follow"
        )
    respond_to do |format|
      if follow.save
        format.html { redirect_to public_user_path(params[:user_id]) }
        format.js
        follow_notice.save
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    follow = current_user.user_relationships.find_by(follow_user_id: params[:user_id])
    follow_notice = current_user.send_notifications.find_by(received_user_id: params[:user_id], action: "follow")
    respond_to do |format|
      if follow.destroy
        format.html { redirect_to public_user_path(params[:user_id]) }
        format.js
        follow_notice.destroy
      end
    end
  end

end
