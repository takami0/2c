class Admin::BookmarksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @bookmarks = @user.bookmarks.page(params[:page]).per(10)
  end

end
