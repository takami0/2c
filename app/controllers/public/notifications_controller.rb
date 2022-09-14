class Public::NotificationsController < ApplicationController
  def index
    @notices = current_user.received_notifications.where(checked: "false")
  end

  def update
    @notice = Notification.find(params[:id])
    @notice.update(checked: "true")
    redirect_to public_user_notifications_path(current_user.id)
  end

  def update_all
  end

end
