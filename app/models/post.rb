class Post < ApplicationRecord

  belongs_to :user
  has_many :CategoryMedia, dependent: :destroy
  has_many :CategoryStyles, dependent: :destroy
  has_many :CategoryMotifs, dependent: :destroy

  has_one_attached :image
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      image.attach(io: File.open(file_path), filename: "no_image.jpeg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  # def self.looks(word)
  #   Post.where("title like? OR introduction like?", "%#{word}%")
  # end

end
