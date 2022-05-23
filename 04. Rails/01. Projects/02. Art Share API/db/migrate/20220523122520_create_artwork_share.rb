class CreateArtworkShare < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false, foreign_key: true
      t.integer :viewer_id, null: false, foreign_key: true
      t.timestamps
    end

    add_index :artwork_shares, %i[artwork_id viewer_id], unique: true
  end
end
