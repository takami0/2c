class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :CategoryMedia, dependent: :destroy
  has_many :occupations, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  has_many :user_relationships, class_name: "Follow", foreign_key: "user_id"
  has_many :followings, through: :user_relationships, source: :follow_user
  
  has_many :follow_user_relationships, class_name: "Follow", foreign_key: "follow_user_id"
  has_many :followings, through: :follow_user_relationships, source: :user
  
  # def follow(other_user)
  #   unless self == other_user
  #     self.relationships.find_or_create_by(follow_id: other_user.id)
  #   end
  # end
  
  # def unfollow(other_user)
  #   relationship = self.relationships.find_by(follow_id: other_user.id)
  #   relationship.destroy if relationship
  # end
  
  # def following?(other_user)
  #   self.followings.include?(other_user)
  # end
  
end
