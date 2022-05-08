# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_508_165_023) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'shortened_urls', force: :cascade do |t|
    t.string 'long_url', null: false
    t.string 'short_url', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['long_url'], name: 'index_shortened_urls_on_long_url'
    t.index ['short_url'], name: 'index_shortened_urls_on_short_url', unique: true
    t.index ['user_id'], name: 'index_shortened_urls_on_user_id'
  end

  create_table 'tag_topics', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_tag_topics_on_name', unique: true
  end

  create_table 'taggings', force: :cascade do |t|
    t.integer 'shortened_url_id'
    t.integer 'tag_topic_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[shortened_url_id tag_topic_id], name: 'index_taggings_on_shortened_url_id_and_tag_topic_id',
                                               unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'premium', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  create_table 'visits', force: :cascade do |t|
    t.integer 'short_url_id', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['short_url_id'], name: 'index_visits_on_short_url_id'
    t.index ['user_id'], name: 'index_visits_on_user_id'
  end
end
