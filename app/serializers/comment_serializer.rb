class CommentSerializer < ActiveModel::Serializer
  attributes :id, :commentText, :created_at
  has_one :user
  has_many :replies
end
