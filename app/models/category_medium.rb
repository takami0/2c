class CategoryMedium < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :post, optional: true

  validates :name, presence: true
end
