class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :password
      t.text :bio
      t.integer :gender
      t.string :phoneNo
      t.string :profileImageURL

      t.timestamps
    end
  end
end
