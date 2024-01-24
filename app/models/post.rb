class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_one_attached :image, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
