class AddUserIdToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :user_id, :integer, null: false
    add_index :cats, :user_id
  end
end
