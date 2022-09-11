class Public::PostsController < ApplicationController
  before_action :set_find, only: [:show, :edit, :update]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to public_posts_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to public_posts_path
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :introduction, :display_status, :image, :user_id)
  end
  
  def set_find
    @post = Post.find(params[:id])
  end

end
