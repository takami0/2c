class Public::NotificationsController < ApplicationController
  def index
    @notices = current_user.received_notifications
  end
end
