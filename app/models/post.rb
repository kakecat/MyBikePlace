class Post < ApplicationRecord
  
  has_one_attached :spot_image
  belongs_to :user
  # belongs_to :comment
  belongs_to :spot
  
  def get_image
    (spot_image.attached?) ? spot_image : 'no_image.jpg'
  end
  
  attribute :latitude, :float
  attribute :longitude, :float
end
