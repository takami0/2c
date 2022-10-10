class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
    display_users = User.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false)
    @display_users = display_users.last(4)
  end

  def search
    @subject = params[:subject]
    if @subject == "ユーザ"
      display_users = User.where(valid_status: true).where.not(display_status: false)
      if display_users.where(params[:category_medium_id]).exists?
        @display_users = display_users.where(category_medium_id: params[:category_medium_id]).where("name like?", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @display_users = display_users.where("name like?", "%#{params[:word]}%").page(params[:page]).per(10)
      end

    elsif @subject == "投稿"
      @posts = Post.all.where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
        #if _post.user.valid_status == true && _post.user.display_statua != false
    else
      []
    end
  end

  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
