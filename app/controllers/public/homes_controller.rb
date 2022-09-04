class Public::HomesController < ApplicationController
  def top
  end

  def search
    @subject = params["subject"]
    if @subject == "ユーザ"
      @users = User.where("name like?", "%#{word}%")
    elsif @subject == "投稿"
      @posts = Post.where("title like? OR introduction like?", "%#{word}%", "%#{word}%")
    else
      []
    end
  end

end
