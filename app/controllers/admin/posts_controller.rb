class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :post_find, only: [:show, :destroy]

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @medium = CategoryMedium.find(@post.category_medium_id)
    @motif = CategoryMotif.find(@post.category_motif_id)
    @style = CategoryStyle.find(@post.category_style_id)
    @comments = @post.comments.order("created_at DESC").page(params[:page]).per(6)
  end

  def destroy
    if @post.destroy!
      redirect_to admin_posts_path
    end
  end

  private
  def post_find
    @post = Post.find(params[:id])
  end

end
