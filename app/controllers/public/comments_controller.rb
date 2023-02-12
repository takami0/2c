class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :preset, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      Comment.create_notification(current_user, @post, @comment) if @comment.post_id != current_user.id
      respond_to do |format|
        format.html { post_path(@post.id) }
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    Comment.destroy_notification(current_user, @post, @comment)
    if @comment.destroy
      respond_to do |format|
        format.html { post_path(@post.id) }
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end

  def preset
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order("created_at DESC").page(params[:page]).per(8)
  end

end
