class InterestRelationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :recipient_id
  has_one :user
  has_one :user
end
