class CreateSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggestions do |t|
      t.string :omdb_api_id
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :watched, default: false

      t.timestamps
    end
  end
end
