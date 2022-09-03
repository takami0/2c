class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :icon

  belongs_to :category_medium, dependent: :destroy
  has_many :occupations, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  has_many :user_relationships, class_name: "Follow", foreign_key: "user_id"
  has_many :follow_user_relationships, class_name: "Follow", foreign_key: "follow_user_id"

  has_many :followings, through: :user_relationships, source: :follow_user
  has_many :followers, through: :follow_user_relationships, source: :user

  def get_icon(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      image.attach(io: File.open(file_path), filename: "no_image.jpeg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
end
