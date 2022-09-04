class Public::HomesController < ApplicationController
  def top
  end
  
  def search
    range = params[:range]
    if range == "ユーザー"
      @users = User.looks(params[:word] )
    elsif range == "投稿"
      @posts = Post.looks(params[:word] )
    else
      render :search
    end
  end

  def result
  end
  
end
