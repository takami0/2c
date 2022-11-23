class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category_medium
  belongs_to :category_motif
  belongs_to :category_style
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image
  has_one_attached :image_sub1
  has_one_attached :image_sub2

  validates :category_medium_id, presence: true
  validates :category_motif_id, presence: true
  validates :category_style_id, presence: true
  validates :title, presence: true
  validates :introduction, length: {minimum: 1, maximum: 240}
  validates :image, presence: true


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


  def self.search_for(subject_sub, word, medium_id, motif_id, style_id)
    if subject_sub == "category_medium"
      if word.present?
        Post.where(category_medium_id: medium_id).where("title like? OR introduction like?", "%" + word + "%", "%" + word + "%")
      else
        Post.where(category_medium_id: medium_id)
      end
    elsif subject_sub == "category_motif"
      if word.present?
        Post.where(category_motif_id: motif_id).where("title like? OR introduction like?", "%" + word + "%", "%" + word + "%")
      else
        Post.where(category_motif_id: motif_id)
      end
    elsif subject_sub == "category_style"
      if word.present?
        Post.where(category_style_id: style_id).where("title like? OR introduction like?", "%" + word + "%", "%" + word + "%")
      else
        Post.where(category_style_id: style_id)
      end
    end
  end

end
