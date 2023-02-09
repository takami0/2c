class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)
  end

  def create
    @post = Post.find(params[:post_id])
    if Bookmark.bookmarked(current_user, @post).blank?
      Bookmark.create(user_id: current_user.id, post_id: @post.id )
      Bookmark.generate_notification(current_user, @post)
      respond_to do |format|
        format.html {redirect_to post_path(@post.id)}
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if Bookmark.bookmarked(current_user, @post).present?
      Bookmark.find_by(user_id: current_user.id, post_id: @post.id).destroy
      Bookmark.destroy_notification(current_user, @post)
      respond_to do |format|
        format.html {redirect_to post_path(@post.id)}
        format.js
      end
    end
  end

end
