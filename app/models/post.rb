class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :comment
  belongs_to :spot
  
  attribute :latitude, :float
  attribute :longitude, :float
end
