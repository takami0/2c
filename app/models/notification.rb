class Notification < ApplicationRecord
  #default_scope => {order(created_at: :desc)}
  belongs_to :send_user, class_name: "User", foreign_key: "send_user_id"
  belongs_to :received_user, class_name: "User", foreign_key: "received_user_id"
  belongs_to :comment, optional: true
  belongs_to :bookmark, optional: true
  belongs_to :follow, optional: true
end
