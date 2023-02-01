class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy
  
  def create_notification
    check = Notification.where(["send_user_id = ? and received_user_id = ? and post_id = ? and action = ?", current_user.id, @post.user_id, @post.id, "bookmark"]) 
  end
  
   notice_bookmark = current_user.send_notifications.new(
      send_user_id: current_user.id,
      received_user_id: @post.user.id,
      post_id: @post.id,
      action: "bookmark"
      )
  
  # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
      
end
