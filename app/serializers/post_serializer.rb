class PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :tags, :contentType, :content, :contentImageURL, :created_at
    attribute :user_id, key: :userID
    attribute :topic_id, key: :topicID
    has_one :user
    has_one :topic
  end
  