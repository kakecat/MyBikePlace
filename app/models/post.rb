class Post < ApplicationRecord

  has_one_attached :spot_image
  belongs_to :user
  belongs_to :spot
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    (spot_image.attached?) ? spot_image : 'default-image.jpg'
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  validates :title, presence: { message: "タイトルを入力してください" }
  validates :content, presence: { message: "内容を入力してください" }

  attribute :latitude, :float
  attribute :longitude, :float
end
