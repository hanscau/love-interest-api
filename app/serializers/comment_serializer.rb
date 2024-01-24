class CommentSerializer < ActiveModel::Serializer
  attributes :id, :commentText, :created_at
  has_one :user
  has_many :comment_likes
  has_many :replies

  def replies
    object.replies.map do |reply|
      {
        id: reply.id,
        replyText: reply.replyText,
        created_at: reply.created_at,
        user: UserSerializer.new(reply.user).as_json,
        reply_likes: reply.reply_likes
      }
    end
  end
end
  
