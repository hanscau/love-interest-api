class PostSerializer < ActiveModel::Serializer
    attributes :id, :title, :tags, :contentType, :content, :contentImageURL, :created_at
    attribute :user_id, key: :userID
    attribute :topic_id, key: :topicID
    has_one :user
    has_one :topic
    has_many :post_likes
    include Rails.application.routes.url_helpers

    def contentImageURL
      rails_blob_url(object.image) if object.image.attached?
    end
  end
  