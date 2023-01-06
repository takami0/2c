class Public::HomesController < ApplicationController

  def top
    @posts = Post.where(display_status: true).reverse
    display_users = User.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false)
    @display_users = display_users.last(4)
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
