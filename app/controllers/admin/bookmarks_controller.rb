class Admin::BookmarksController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.find(params[:user_id])
    @bookmarks = @user.bookmarks.page(params[:page]).per(10)
  end

end
