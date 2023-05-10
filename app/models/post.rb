class Post < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :spot
end
