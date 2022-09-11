class Public::BookmarksController < ApplicationController
  before_action :set_find, only: [:create, :destroy]

  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    bookmark_assign = Bookmark.new(user_id: current_user.id, post_id: @post.id )
    if bookmark_assign.save
      Bookmark.notice_bookmark
      redirect_to public_post_path(@post.id)
    end
  end

  def destroy
    bookmark_release = Bookmark.find_by(user_id: current_user.id, post_id: @post.id).destroy
    if bookmark_release
      Bookmark.notice_bookmark_delete
      redirect_to public_post_path(@post.id)
    end
  end

  private
  def set_find
    @post = Post.find(params[:post_id])
  end

end
