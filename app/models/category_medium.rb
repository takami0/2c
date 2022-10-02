class CategoryMedium < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true

  validates :name, presence: true
end
