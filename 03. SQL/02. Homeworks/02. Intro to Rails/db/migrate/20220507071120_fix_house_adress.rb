class FixHouseAdress < ActiveRecord::Migration[7.0]
  def change
    rename_column :houses, :name, :address
  end
end
