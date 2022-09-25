class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @posts = Post.all.reverse
    @users = User.where(display_status: true).last(4)
  end
  
  def search
    @subject = params[:subject]
    if @subject == "ユーザ"
      @users = User.where("name like?", "%#{params[:word]}%").page(params[:page]).per(10)
    elsif @subject == "投稿"
      @posts = Post.where("title like? OR introduction like?", "%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
    else
      []
    end
  end
end
