class Public::CommentsController < ApplicationController
  before_action :set_find, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if comment.save
      redirect_to public_post_path(@post.id)
    end
  end

  def destroy
    comment_destroy = Comment.find(params[:id]).destroy
    if comment_destroy
      redirect_to public_post_path(@post.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
  
  def set_find
    @post = Post.find(params[:post_id])
  end

end
