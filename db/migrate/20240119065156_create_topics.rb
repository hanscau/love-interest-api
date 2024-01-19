class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :topic
      t.string :topicImageURL

      t.timestamps
    end
  end
end
