class Public::NotificationsController < ApplicationController

  def index
    @notices = current_user.received_notifications.where(checked: "false").page(params[:page]).per(10)
  end

  def update
    @notice = Notification.find(params[:id])
    @notice.update(checked: "true")
    redirect_to public_user_notifications_path(current_user.id)
  end

  def update_all
    @notices = current_user.received_notifications.where(checked: "false")
    @notices.update(checked: "true")
    redirect_to public_user_notifications_path(current_user.id)
  end

end
