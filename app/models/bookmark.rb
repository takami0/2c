class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  def notice_bookmark
    notice = current_user.send_notifications.new(
      send_user_id: current_user.id,
      received_user_id: @post.user.id,
      #bookmark_id: @bookmark.id,
      post_id: @post.id,
      action: "bookmark"
      )
    notice.save if Notification.valid?
  end

  def notice_bookmark_delete
    current_user.send_notifications.find_by(post_id: @post.id).destroy if Notification.valid?
  end

end
