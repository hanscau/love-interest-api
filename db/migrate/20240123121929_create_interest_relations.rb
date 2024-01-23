class CreateInterestRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :interest_relations do |t|
      t.references :sender
      t.references :recipient

      t.timestamps
    end

    add_foreign_key :interest_relations, :users, column: :sender_id, primary_key: :id
    add_foreign_key :interest_relations, :users, column: :recipient_id, primary_key: :id
  end
end
