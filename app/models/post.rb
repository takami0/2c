class Post < ApplicationRecord

  belongs_to :user
  has_one :category_medium, dependent: :destroy
  has_one :category_motif, dependent: :destroy
  has_one :category_style, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image
  has_one_attached :image_sub1
  has_one_attached :image_sub2
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      image.attach(io: File.open(file_path), filename: "no_image.jpeg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def get_image_sub1(width, height)
    image_sub1.variant(resize_to_limit: [width, height]).processed
  end
  
  def get_image_sub2(width, height)
    image_sub2.variant(resize_to_limit: [width, height]).processed
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end
