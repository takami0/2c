class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy

  scope :bookmarked, -> (current_user, _post) { where("user_id = ? and post_id = ?", current_user.id, _post.id) }

  def self.create_notification(current_user, _post)
    current_user.send_notifications.create(
      send_user_id: current_user.id,
      received_user_id: _post.user.id,
      post_id: _post.id,
      action: "bookmark"
      )
  end

  def self.destroy_notification(current_user, _post)
    current_user.send_notifications.find_by(
      send_user_id: current_user.id,
      received_user_id: _post.user.id,
      post_id: _post.id,
      action: "bookmark"
      ).destroy
  end

end