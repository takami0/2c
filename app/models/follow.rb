class Follow < ApplicationRecord
  belongs_to :user_relationships, foreign_key: "user_id"
  belongs_to :follow_user_relationships,  foreign_key: "follow_user_id"

end
