class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_one_attached :image, dependent: :destroy
end
