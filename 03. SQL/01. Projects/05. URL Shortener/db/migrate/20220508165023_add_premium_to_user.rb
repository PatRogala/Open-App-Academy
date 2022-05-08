class AddPremiumToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :premium, :boolean, default: false
  end
end
