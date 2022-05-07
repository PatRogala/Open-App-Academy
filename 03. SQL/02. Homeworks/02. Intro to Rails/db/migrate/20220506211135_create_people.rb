class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
