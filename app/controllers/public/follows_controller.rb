class Public::FollowsController < ApplicationController
  def create
    current_user.user_relationships.create(follow_user_id: params[:user_id])
    redirect_to public_users_path
  end

  def destroy
    current_user.user_relationships.find_by(follow_user_id: params[:user_id]).destroy
    redirect_to public_users_path
  end

end
