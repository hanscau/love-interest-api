class ReplyLike < ApplicationRecord
  belongs_to :user
  belongs_to :reply

  validates :user_id, uniqueness: { scope: :reply_id, message: "has already liked this reply" }
end
