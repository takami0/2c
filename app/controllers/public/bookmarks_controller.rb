class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:destroy]

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)
  end

  def create
    @post = Post.find(params[:post_id])
    if Bookmark.bookmarked(current_user, @post).blank?
      Bookmark.create(user_id: current_user.id, post_id: @post.id )
      Bookmark.generate_notification(current_user, @post)
      respond_to do |format|
        format.html {redirect_to post_path(_post.id)}
        format.js
      end
    end
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, post_id: @post.id)
    notice_bookmark = current_user.send_notifications.find_by(post_id: @post.id, action: "bookmark")
    respond_to do |format|
      if bookmark.destroy
        format.html {redirect_to post_path(@post.id)}
        format.js
        notice_bookmark.destroy
      end
    end
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

end
