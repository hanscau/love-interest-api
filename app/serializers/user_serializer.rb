class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :bio, :firstName, :lastName, :profileImageURL, :gender, :phoneNo
    include Rails.application.routes.url_helpers

    def profileImageURL
      rails_blob_url(object.image) if object.image.attached?
    end
end