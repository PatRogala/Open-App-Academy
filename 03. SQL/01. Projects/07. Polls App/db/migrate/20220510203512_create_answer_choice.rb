class CreateAnswerChoice < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_choices do |t|
      t.string :text, null: false
      t.integer :question_id, null: false
      t.timestamps
    end

    add_index :answer_choices, :question_id
  end
end
