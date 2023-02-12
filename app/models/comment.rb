class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

  def self.create_notification(current_user, _post, comment)
    current_user.send_notifications.create(
      send_user_id: current_user.id,
      received_user_id: _post.user.id,
      post_id: _post.id,
      comment_id: comment.id,
      action: "comment"
      )
  end

  def self.destroy_notification(current_user, _post, comment)
    current_user.send_notifications.find_by(
      send_user_id: current_user.id,
      received_user_id: _post.user.id,
      post_id: _post.id,
      comment_id: comment.id,
      action: "comment"
      ).destroy
  end

end
