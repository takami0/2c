class Admin::PostsController < ApplicationController
  before_action :post_find, only: [:show, :destroy]

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
    @medium = CategoryMedium.find(@post.category_medium_id)
    @motif = CategoryMotif.find(@post.category_motif_id)
    @style = CategoryStyle.find(@post.category_style_id)
    @comments = @post.comments.reverse
  end

  def destroy
    user = User.find(@post.user.id)
    if @post.destroy!
      redirect_to public_user_path(user.id)
    end
  end

  private
  def post_find
    @post = Post.find(params[:id])
  end

end
