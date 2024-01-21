class ReplyLikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :reply_id
  has_one :user
  has_one :reply
end
