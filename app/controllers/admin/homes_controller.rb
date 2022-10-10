class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = Post.all.reverse
    @users = User.where(display_status: true).last(4)
  end

  def search
    @subject = params[:subject]
    if @subject == "ユーザ_媒体別"
      if User.where("name like?", "%#{params[:word]}%")
        @users = User.where(category_medium_id: params[:category_medium_id]).where("name like?", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @users = User.where(category_medium_id: params[:category_medium_id]).page(params[:page]).per(10)
      end

    elsif @subject == "投稿_媒体別"
      if Post.where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%")
        @posts = Post.where(category_medium_id: params[:category_medium_id]).where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @posts = Post.where(category_medium_id: params[:category_medium_id]).page(params[:page]).per(10)
      end
    elsif @subject == "投稿_モチーフ別"
      if Post.where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%")
        @posts = Post.where(category_motif_id: params[:category_motif_id]).where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @posts = Post.where(category_motif_id: params[:category_motif_id]).page(params[:page]).per(10)
      end
    elsif @subject == "投稿_スタイル別"
      if Post.where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%")
        @posts = Post.where(category_style_id: params[:category_style_id]).where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @posts = Post.where(category_style_id: params[:category_style_id]).page(params[:page]).per(10)
      end
    end
  end

end
