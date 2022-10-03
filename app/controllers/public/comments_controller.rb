class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_find, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      notice = current_user.send_notifications.new(
        send_user_id: current_user.id,
        received_user_id: @post.user.id,
        post_id: @post.id,
        comment_id: @comment.id,
        action: "comment"
        )
      notice.save if notice.received_user_id != current_user.id
      redirect_to public_post_path(@post.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      #current_user.send_notifications.find_by(comment_id: @comment.id, action: "comment").destroy
      redirect_to public_post_path(@post.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end

  def post_find
    @post = Post.find(params[:post_id])
  end

end
