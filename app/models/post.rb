class Post < ApplicationRecord
  belongs_to :user
  has_many :CategoryMedia, dependent: :destroy
  has_many :CategoryStyles, dependent: :destroy
  has_many :CategoryMotifs, dependent: :destroy
end
