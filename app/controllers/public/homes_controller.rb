class Public::HomesController < ApplicationController

  def top
    display_posts = []
    posts = Post.all
    posts.each do |_post|
      if _post.user.valid_status == true && _post.user.display_status != false
        _post.all => display_posts
      end
    end
    binding.pry
    @display_posts = display_posts.all
    @display_users = User.where(valid_status: true).where.not(display_status: false).last(4)
  end

  def search
    @subject = params[:subject]
    if @subject == "ユーザ"
      @valid_users = User.where(valid_status: true).where.not(display_status: false)
      @users = @valid_users.where("name like?", "%#{params[:word]}%").page(params[:page]).per(10)
    elsif @subject == "投稿"
      display_posts = []
      posts = Post.all
      posts.each do |_post|
        if _post.user.valid_status == true && _post.user.display_statua != false
          _post.id => display_posts
        end
      end
      @display_posts = display_posts.where(
        "title like? OR introduction like?",
        "%#{params[:word]}%", "%#{params[:word]}%"
        ).page(params[:page]).per(10)
    else
      []
    end
  end

  def guest_destroy
    User.destroy(current_user.id)
    redirect_to new_user_registration_path
  end

end
