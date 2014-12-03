# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141203162654) do

  create_table "file_attaches", force: true do |t|
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "file_attaches", ["message_id"], name: "index_file_attaches_on_message_id"

  create_table "followers", force: true do |t|
    t.integer  "user_id"
    t.integer  "fw_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followers", ["fw_id"], name: "index_followers_on_fw_id"
  add_index "followers", ["user_id"], name: "index_followers_on_user_id"

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.string   "subject"
    t.text     "message"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id", "sender_id", "created_at"], name: "index_messages_on_user_id_and_sender_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "degree"
    t.string   "position"
    t.string   "institution"
    t.string   "department"
  end

end
