class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create, :destroy]

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)
  end

  def create
    @bookmark = Bookmark.new(user_id: current_user.id, post_id: @post.id )
    notice_bookmark = current_user.send_notifications.new(
      send_user_id: current_user.id,
      received_user_id: @post.user.id,
      post_id: @post.id,
      action: "bookmark"
      )
    respond_to do |format|
      if @bookmark.save
        format.html {redirect_to post_path(@post.id)}
        format.js
        notice_bookmark.save
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
