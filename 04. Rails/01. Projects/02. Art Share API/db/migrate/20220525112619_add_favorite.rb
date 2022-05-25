class AddFavorite < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :favorite, :boolean, default: false, null: false
    add_column :artwork_shares, :favorite, :boolean, default: false, null: false
  end
end
