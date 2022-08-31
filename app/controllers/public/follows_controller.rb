class Public::FollowsController < ApplicationController
  def create
    current_user.user_relationships.create(follow_user_id: params[:user_id])
    redirect_to [:user, {id: params[:user_id]}]
  end
  
  def destroy
    current_user.follow_relationships.find_by(follow_user_id: params[:user_id]).destroy
    redirect_to [:user, {id: params[:user_id]}]
  end
  
end
