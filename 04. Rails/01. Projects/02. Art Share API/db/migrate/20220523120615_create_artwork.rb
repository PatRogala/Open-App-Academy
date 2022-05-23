class CreateArtwork < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false, foreign_key: true
      t.timestamps
    end

    add_index :artworks, %i[title artist_id], unique: true
  end
end
