class Public::HomesController < ApplicationController
  def top
  end

  def search
    @subject = params[:subject]
    if @subject == "ユーザ"
      @users = User.where("name like?", "%#{params[:word]}%")
    elsif @subject == "投稿"
      pp "aaaaaaa"
      pp @subject
      pp params[:word]
      @posts = Post.where("title like? OR introduction like?", "%#{params[:word]}%", "%#{params[:word]}%")
    else
      []
    end
  end

end
