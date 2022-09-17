class CategoryStyle < ApplicationRecord
  belongs_to :post, optional: true
end
