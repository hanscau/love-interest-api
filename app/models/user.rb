class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_one_attached :image, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :sent_interest, :class_name => "InterestRelation", :foreign_key => "sender_id", dependent: :destroy
    has_many :received_interest, :class_name => "InterestRelation", :foreign_key => "recipient_id", dependent: :destroy
end
