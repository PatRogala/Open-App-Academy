class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.integer :short_url_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :visits, :short_url_id
    add_index :visits, :user_id
  end
end
