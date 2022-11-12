class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
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
      @users = User.search_for(@subject_sub, @word, @occupation_id, @medium_id ).page(params[:page]).per(10)
    elsif @subject_main == "post"
      @posts = Post.search_for(@subject_sub, @word, @medium_id, @motif_id, @style_id).page(params[:page]).per(10)
    end
  end

end
