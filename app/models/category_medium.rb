class CategoryMedium < ApplicationRecord
  has_many :users
  belongs_to :post, optional: true
end
