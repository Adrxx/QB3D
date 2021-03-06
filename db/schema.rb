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

ActiveRecord::Schema.define(version: 20160303094511) do

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "featured"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "photo_file_file_name"
    t.string   "photo_file_content_type"
    t.integer  "photo_file_file_size"
    t.datetime "photo_file_updated_at"
    t.text     "link_url"
    t.string   "link_name"
  end

  create_table "c4_preferences", force: :cascade do |t|
    t.text   "values",     default: "[]"
    t.text   "youtube"
    t.text   "facebook"
    t.text   "twitter"
    t.string "email"
    t.string "telephone"
    t.string "telephone2"
  end

  create_table "c4_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "c4_users", ["email"], name: "index_c4_users_on_email", unique: true
  add_index "c4_users", ["reset_password_token"], name: "index_c4_users_on_reset_password_token", unique: true

  create_table "colors", force: :cascade do |t|
    t.string   "hex"
    t.boolean  "available"
    t.integer  "material_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "colors", ["material_id"], name: "index_colors_on_material_id"

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.boolean  "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
