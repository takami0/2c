class Public::BookmarksController < ApplicationController
  before_action :set_find, only: [:create, :destroy]

  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    @bookmark = Bookmark.new(user_id: current_user.id, post_id: @post.id )
    if @bookmark.save
      notice = current_user.send_notifications.new(
        send_user_id: current_user.id,
        received_user_id: @post.user.id,
        post_id: @post.id,
        action: "bookmark"
      )
      notice.save
      redirect_to public_post_path(@post.id)
    end
  end

  def destroy
    bookmark_release = Bookmark.find_by(user_id: current_user.id, post_id: @post.id).destroy
    if bookmark_release
      current_user.send_notifications.find_by(post_id: @post.id, action: "bookmark").destroy
      redirect_to public_post_path(@post.id)
    end
  end

  private
  def set_find
    @post = Post.find(params[:post_id])
  end

end
