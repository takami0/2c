class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :icon
  belongs_to :category_medium
  belongs_to :occupation
  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :user_relationships, class_name: "Follow", foreign_key: "user_id", dependent: :destroy
  has_many :follow_user_relationships, class_name: "Follow", foreign_key: "follow_user_id", dependent: :destroy
  has_many :followings, through: :user_relationships, source: :follow_user, dependent: :destroy
  has_many :followers, through: :follow_user_relationships, source: :user, dependent: :destroy

  has_many :send_notifications, class_name: "Notification", foreign_key: "send_user_id", dependent: :destroy
  has_many :received_notifications, class_name: "Notification", foreign_key: "received_user_id", dependent: :destroy


  validates :category_medium_id, presence: true
  validates :occupation_id, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true

  enum address:{
     北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
     茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
     新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
     岐阜県:20,静岡県:21,愛知県:22,三重県:23,
     滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
     鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
     徳島県:35,香川県:36,愛媛県:37,高知県:38,
     福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,
     沖縄県:46
   }


  def get_icon(width, height)
    unless icon.attached?
      # binding.pry
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      icon.attach(io: File.open(file_path), filename: "no_image.jpg", content_type: "image/jpeg")
    end
    icon.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.display_users
    User.where(
      valid_status: true,
      member_status: 1,
      display_status: true
      )
  end

  def self.search_for(subject_sub, word, occupation_id, medium_id)
    if subject_sub == "occupation"
      if word.present?
        User.where(occupation_id: occupation_id).where("name like?", "%" + word + "%")
      else
        User.where(occupation_id: occupation_id)
      end
    elsif subject_sub == "category_medium"
      if word.present?
        User.where(category_medium_id: medium_id).where("name like?", "%" + word + "%")
      else
        User.where(category_medium_id: medium_id)
      end
    end
  end

end
