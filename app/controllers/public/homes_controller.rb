class Public::HomesController < ApplicationController

  def top
    @posts = Post.all.reverse
    @users = User.where(valid_status: true).where.not(display_status: false).last(4)
  end

  def search
    @subject = params[:subject]
    if @subject == "ユーザ"
      @valid_users = User.where(valid_status: true).where.not(display_status: false)
      @users = @valid_users.where("name like?", "%#{params[:word]}%").page(params[:page]).per(10)
    elsif @subject == "投稿"
      @posts = Post.where("title like? OR introduction like?", "%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
    else
      []
    end
  end

  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
