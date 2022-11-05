class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
    display_users = User.where(valid_status: true).where.not(member_status: 2).where.not(display_status: false)
    @display_users = display_users.last(4)
  end

  def search
    @subject = params[:subject]
    display_users = User.where(valid_status: true).where.not(display_status: false)
    if @subject == "ユーザ_媒体別"
      @medium = CategoryMedium.find(params[:category_medium_id])
      if display_users.where("name like?", "%#{params[:word]}%")
        @display_users = display_users.where(category_medium_id: params[:category_medium_id]).where("name like?", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @display_users = display_users.where(category_medium_id: params[:category_medium_id]).page(params[:page]).per(10)
      end

    elsif @subject == "投稿_媒体別"
      @medium = CategoryMedium.find(params[:category_medium_id])
      if Post.where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%")
        @posts = Post.where(category_medium_id: params[:category_medium_id]).where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @posts = Post.where(category_medium_id: params[:category_medium_id]).page(params[:page]).per(10)
      end
    elsif @subject == "投稿_モチーフ別"
      @motif = CategoryMotif.find(params[:category_motif_id])
      if Post.where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%")
        @posts = Post.where(category_motif_id: params[:category_motif_id]).where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @posts = Post.where(category_motif_id: params[:category_motif_id]).page(params[:page]).per(10)
      end
    elsif @subject == "投稿_スタイル別"
      @style = CategoryStyle.find(params[:category_style_id])
      if Post.where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%")
        @posts = Post.where(category_style_id: params[:category_style_id]).where("title like? OR introduction like?","%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(10)
      else
        @posts = Post.where(category_style_id: params[:category_style_id]).page(params[:page]).per(10)
      end
    end
  end

  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
