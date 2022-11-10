class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :follow_user, class_name: "User", foreign_key: "follow_user_id"
  has_many :notifications, dependent: :destroy

  def notice_follow
    notice = current_user.send_notifications.new(
      send_user_id: current_user.id,
      received_user_id: params[:user_id],
      action: "follow"
      )
    notice.save if Notification.valid?
  end

  def notice_follow_delete
    current_user.send_notifications.find_by(received_user_id: params[:user_id]).destroy if Notification.valid?
  end
    

end
