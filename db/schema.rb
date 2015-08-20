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

ActiveRecord::Schema.define(version: 20150820220752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "activity_name"
    t.text     "description"
    t.string   "category"
    t.string   "lat"
    t.string   "lng"
    t.string   "location"
    t.integer  "itinerary_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "items", ["itinerary_id"], name: "index_items_on_itinerary_id", using: :btree

  create_table "itineraries", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "parent"
    t.string   "slug"
  end

  add_index "itineraries", ["slug"], name: "index_itineraries_on_slug", unique: true, using: :btree
  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "hometown"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  add_foreign_key "items", "itineraries"
  add_foreign_key "itineraries", "users"
end
