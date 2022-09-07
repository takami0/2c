class Public::BookmarksController < ApplicationController

  def index
    @posts = current_user.bookmarks.all
  end

  def create
    @post = Post.find(params[:post_id])
    bookmark_assign = @post.bookmarks.new(user_id: current_user.id).save(bookmark_params)
    if bookmark_assign
      redirect_to public_post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark_release = @post.bookmarks.find_by(user_id: current_user.id).destroy
    if bookmark_release
      redirect_to public_post_path(@post.id)
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:user_id)
  end
end
