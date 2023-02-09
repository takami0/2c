class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :preset, only: [:create, :destroy]
  
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
      respond_to do |format|
        format.html { post_path(@post.id) }
        format.js
      end
    end
  end

  # def create
  #   @comment = Comment.new(comment_params)
  #   notice = current_user.send_notifications.new(
  #     send_user_id: current_user.id,
  #     received_user_id: @post.user.id,
  #     post_id: @post.id,
  #     comment_id: @comment.id,
  #     action: "comment"
  #     )
  #   if @comment.save
  #     notice.save if notice.received_user_id != current_user.id
  #     respond_to do |format|
  #       format.html { post_path(@post.id) }
  #       format.js
  #     end
  #   end
  # end

  def destroy
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.destroy
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
