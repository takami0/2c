class Public::HomesController < ApplicationController

  def top
    @posts = Post.all.reverse
    @users = User.where(display_status: true).last(4)

  end

  def search
    @subject = params[:subject]
    if @subject == "ユーザ"
      @users = User.where("name like?", "%#{params[:word]}%")
    elsif @subject == "投稿"
      @posts = Post.where("title like? OR introduction like?", "%#{params[:word]}%", "%#{params[:word]}%")
    else
      []
    end
  end

  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
