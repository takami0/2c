class Public::HomesController < ApplicationController

  def top
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

  def my_page
    @medium = CategoryMedium.find(current_user.category_medium_id)
    @occupation = Occupation.find(current_user.occupation_id)
  end

  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
