class Public::BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    @post = Post.find(params[:post_id])
    bookmark_assign = Bookmark.create(user_id: current_user.id, post_id: @post.id)
    if bookmark_assign
      redirect_to public_post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark_release = Bookmark.find_by(user_id: current_user.id, post_id: @post.id).destroy
    if bookmark_release
      redirect_to public_post_path(@post.id)
    end
  end

end
