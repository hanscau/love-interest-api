class CreateReplyLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :reply_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
