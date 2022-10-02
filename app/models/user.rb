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

  enum address:{
     "-お住まいの地域を選択ください-":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
   }

  def get_icon(width, height)
    unless icon.attached?
      # binding.pry
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      icon.attach(io: File.open(file_path), filename: "no_image.jpg", content_type: "image/jpeg")
    end
    icon.variant(resize_to_limit: [width, height]).processed
  end

  validates :category_medium_id, presence: true
  validates :occupation_id, presence: true
  validates :name, presence: true
  #validates :email, presence: true
  #validates :password, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true

end
