class Public::FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    follow = current_user.user_relationships.create(follow_user_id: params[:user_id])
    if follow
      notice = current_user.send_notifications.new(
        send_user_id: current_user.id,
        received_user_id: params[:user_id],
        action: "follow"
        )
      notice.save
      redirect_to public_user_path(params[:user_id])
    end
  end

  def destroy
    unfollow = current_user.user_relationships.find_by(follow_user_id: params[:user_id]).destroy
    if unfollow
      current_user.send_notifications.find_by(received_user_id: params[:user_id], action: "follow").destroy
      redirect_to public_user_path(params[:user_id])
    end
  end

end
