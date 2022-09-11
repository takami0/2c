class Public::FollowsController < ApplicationController
  def create
    current_user.user_relationships.create(follow_user_id: params[:user_id])
    notice_follow
    redirect_to public_users_path
  end

  def destroy
    current_user.user_relationships.find_by(follow_user_id: params[:user_id]).destroy
    notice_follow_delete
    redirect_to public_users_path
  end

end
