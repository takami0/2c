class Public::PostsController < ApplicationController
  before_action :post_find, only: [:show, :edit, :update, :destroy]

  def index
    display_posts = []
    posts = Post.all
    posts.each do |_post|
      if _post.user.valid_status == true && _post.user.display_statua != false
        _post.id => display_posts
      end
    end
    @display_posts = display_posts.page(params[:page]).per(10)
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
    @medium = CategoryMedium.find(@post.category_medium_id)
    @motif = CategoryMotif.find(@post.category_motif_id)
    @style = CategoryStyle.find(@post.category_style_id)
    @comment = Comment.new
    @comments = @post.comments.reverse
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

  def destroy
    user = User.find(@post.user.id)
    if @post.destroy!
      redirect_to public_user_path(user.id)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :introduction, :display_status, :image, :image_sub1, :image_sub2, :user_id, :category_medium_id, :category_motif_id, :category_style_id)
  end

  def post_find
    @post = Post.find(params[:id])
  end

end
