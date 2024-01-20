class ReplySerializer < ActiveModel::Serializer
  attributes :id, :replyText
  has_one :user
end
