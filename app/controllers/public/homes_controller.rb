class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
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
      @records = User.search_for(@subject_sub, @word, @occupation_id, @medium_id )
      if @subject_sub == "category_medium"
        @medium = CategoryMedium.find(@medium_id)
      elsif @subject_sub == "occupation"
        @occupation = Occupation.find(@occupation_id)
      end
    elsif @subject_main == "post"
      @records = Post.search_for(@subject_sub, @word, @medium_id, @motif_id, @style_id)
      if @subject_sub == "category_medium"
        @medium = CategoryMedium.find(@medium_id)
      elsif @subject_sub == "category_motif"
        @motif = CategoryMotif.find(@motif_id)
      elsif @subject_sub == "category_style"
        @style = CategoryStyle.find(@style_id)
      end
    end
  end
  

  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
