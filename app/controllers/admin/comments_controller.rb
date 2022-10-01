class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      #current_user.send_notifications.find_by(comment_id: @comment.id, action: "comment").destroy
      redirect_to admin_post_path(@post.id)
    end
  end

end
