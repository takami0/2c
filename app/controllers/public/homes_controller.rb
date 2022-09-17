class Public::HomesController < ApplicationController
  def top
  end

  def my_page
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

end
