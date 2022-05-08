class CreateTagTopic < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_topics do |t|
      t.string :name
      t.timestamps
    end

    create_table :taggings do |t|
      t.integer :shortened_url_id
      t.integer :tag_topic_id
      t.timestamps
    end

    add_index :taggings, %i[shortened_url_id tag_topic_id], unique: true
    add_index :tag_topics, :name, unique: true
  end
end
