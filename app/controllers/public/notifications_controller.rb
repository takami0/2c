class Public::NotificationsController < ApplicationController
  before_action :set_notices, only: [:index, :update_all]

  def index
  end

  def update
    @notice = Notification.find(params[:id])
    @notice.update(checked: "true")
    redirect_to public_user_notifications_path(current_user.id)
  end

  def update_all
    @notices.update(checked: "true")
    redirect_to public_user_notifications_path(current_user.id)
  end

  private
  def set_notices
    @notices = current_user.received_notifications.where(checked: "false")
  end

end
