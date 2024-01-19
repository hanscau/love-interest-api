class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.string :title
      t.string :tags
      t.integer :contentType
      t.text :content
      t.string :contentImageURL

      t.timestamps
    end
  end
end
