class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy
  
  def notice_comment
    notice = current_user.send_notifications.new(
      send_user_id: current_user.id,
      received_user_id: @post.user.id,
      comment_id: @comment.id,
      action: "comment"
      )
    notice.save if Notification.valid?
  end
  
  def notice_comment_delete
    current_user.send_notifications.find_by(comment_id: @comment.id).destroy if Notification.valid?
  end
  
end
