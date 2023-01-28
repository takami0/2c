class Public::HomesController < ApplicationController

  def top
    @display_users = User.display_users.order(created_at: :desc).first(4)
    posts  = Post.where(display_status: true).joins(:user).where(users: {valid_status: true,member_status: 1,display_status: true})
    @display_posts = posts.order(created_at: :desc).first(4)
  end


  def search
    @subject_main = params[:subject_main]
    @subject_sub = params[:subject_sub]
    @word = params[:word]
    @occupation_id = params[:occupation_id]
    @medium_id = params[:category_medium_id]
    @motif_id = params[:category_motif_id]
    @style_id = params[:category_style_id]
    if @subject_main == "user"
      search_for_users = User.search_for(@subject_sub, @word, @occupation_id, @medium_id )
      @display_users = search_for_users.where(valid_status: true).where.not(display_status: false).page(params[:page]).per(10)
    elsif @subject_main == "post"
      @posts = Post.search_for(@subject_sub, @word, @medium_id, @motif_id, @style_id).page(params[:page]).per(10)
    end
  end


  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
