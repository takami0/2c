class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :follow_user, class_name: "User", foreign_key: "follow_user_id"
  has_many :notifications, dependent: :destroy

  def self.create_notification(current_user, received_user)
    current_user.send_notifications.create(
      send_user_id: current_user.id,
      received_user_id: received_user.id,
      action: "follow"
      )
  end

  def self.destroy_notification(current_user, received_user)
  end

  def notice_follow_delete
    current_user.send_notifications.find_by(received_user_id: params[:user_id]).destroy if Notification.valid?
  end


end
