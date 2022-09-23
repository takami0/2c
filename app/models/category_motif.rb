class CategoryMotif < ApplicationRecord
  belongs_to :post, optional: true
end
