class Comment < ApplicationRecord
  
  belongs_to :user
  has_many :posts, dependent: :dest
end
