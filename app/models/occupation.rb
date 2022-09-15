class Occupation < ApplicationRecord
  has_many :users, dependent: :destroy
end
