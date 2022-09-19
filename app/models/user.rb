class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :category_medium
  has_one :occupation
  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :user_relationships, class_name: "Follow", foreign_key: "user_id", dependent: :destroy
  has_many :follow_user_relationships, class_name: "Follow", foreign_key: "follow_user_id", dependent: :destroy

  has_many :followings, through: :user_relationships, source: :follow_user, dependent: :destroy
  has_many :followers, through: :follow_user_relationships, source: :user, dependent: :destroy

  has_many :send_notifications, class_name: "Notification", foreign_key: "send_user_id", dependent: :destroy
  has_many :received_notifications, class_name: "Notification", foreign_key: "received_user_id", dependent: :destroy

  has_one_attached :icon
  def get_icon(width, height)
    unless icon.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      icon.attach(io: File.open(file_path), filename: "no_image.jpeg", content_type: "image/jpeg")
    end
    icon.variant(resize_to_limit: [width, height]).processed
  end

end
