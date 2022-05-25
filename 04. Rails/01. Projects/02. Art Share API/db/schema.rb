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

ActiveRecord::Schema[7.0].define(version: 20_220_525_112_619) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'artwork_shares', force: :cascade do |t|
    t.integer 'artwork_id', null: false
    t.integer 'viewer_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'favorite', default: false, null: false
    t.index %w[artwork_id viewer_id], name: 'index_artwork_shares_on_artwork_id_and_viewer_id', unique: true
  end

  create_table 'artworks', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'image_url', null: false
    t.integer 'artist_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'favorite', default: false, null: false
    t.index %w[title artist_id], name: 'index_artworks_on_title_and_artist_id', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'body', null: false
    t.integer 'artwork_id', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['artwork_id'], name: 'index_comments_on_artwork_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'likeable_id', null: false
    t.integer 'likeable_type', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[likeable_id likeable_type user_id],
            name: 'index_likes_on_likeable_id_and_likeable_type_and_user_id', unique: true
    t.index ['likeable_id'], name: 'index_likes_on_likeable_id'
    t.index ['likeable_type'], name: 'index_likes_on_likeable_type'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'username', null: false
    t.index ['username'], name: 'index_users_on_username', unique: true
  end
end
