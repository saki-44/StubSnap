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

ActiveRecord::Schema[7.0].define(version: 20_240_119_231_209) do
  create_table 'categories', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'stub_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['stub_id'], name: 'index_likes_on_stub_id'
    t.index %w[user_id stub_id], name: 'index_likes_on_user_id_and_stub_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'stubs', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'address'
    t.text 'memo'
    t.integer 'status', default: 0, null: false
    t.string 'stub_image', null: false
    t.date 'date', default: -> { 'CURRENT_DATE' }, null: false
    t.integer 'user_id', null: false
    t.integer 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_stubs_on_category_id'
    t.index ['user_id'], name: 'index_stubs_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'crypted_password'
    t.string 'salt'
    t.string 'name', null: false
    t.string 'sns'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'remember_me_token'
    t.datetime 'remember_me_token_expires_at'
    t.string 'reset_password_token'
    t.datetime 'reset_password_token_expires_at'
    t.datetime 'reset_password_email_sent_at'
    t.integer 'access_count_to_reset_password_page', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['remember_me_token'], name: 'index_users_on_remember_me_token'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token'
  end

  add_foreign_key 'likes', 'stubs'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'stubs', 'categories'
  add_foreign_key 'stubs', 'users'
end
