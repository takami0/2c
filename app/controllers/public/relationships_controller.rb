class RelationshipsController < ApplicationController
  def follower
  end

  def following
  end
  
  def create
    @user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(@user)
    if following.save
      redirect_to public_users_path
    else
      render :following
    end
  end
  
  def destroy
    @user = User.find(params[:relationship][:follow_id])８９
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to public_users_path
    else
      render :following
    end
  end

  
end
