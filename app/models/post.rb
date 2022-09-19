class Post < ApplicationRecord

  belongs_to :user
  has_one :CategoryMedium, dependent: :destroy
  has_one :CategoryMotif, dependent: :destroy
  has_one :CategoryStyle, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      image.attach(io: File.open(file_path), filename: "no_image.jpeg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end
