class InterestRelation < ApplicationRecord
  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  validates :sender_id, uniqueness: { scope: :recipient_id, message: "has already shown interest to this person" }
end
