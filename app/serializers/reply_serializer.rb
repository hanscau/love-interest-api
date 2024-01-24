class ReplySerializer < ActiveModel::Serializer
  attributes :id, :replyText, :created_at
  has_many :reply_likes
  has_one :user
end
