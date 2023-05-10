class Spot < ApplicationRecord
  belongs_to :user
  has_one :post
end
