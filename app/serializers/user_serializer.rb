class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :bio, :firstName, :lastName, :profileImageURL, :gender, :phoneNo
end