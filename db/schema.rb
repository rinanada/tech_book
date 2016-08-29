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

ActiveRecord::Schema.define(version: 20160829100305) do

  create_table "buyings", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exhibit_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "profile_id", limit: 4
  end

  add_index "buyings", ["exhibit_id"], name: "index_buyings_on_exhibit_id", using: :btree
  add_index "buyings", ["profile_id"], name: "index_buyings_on_profile_id", using: :btree
  add_index "buyings", ["user_id"], name: "index_buyings_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "langage",    limit: 4
    t.integer  "design",     limit: 4
    t.integer  "other",      limit: 4
  end

  create_table "exhibits", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",       limit: 255
    t.string   "sub_title",   limit: 255
    t.integer  "price",       limit: 4
    t.integer  "state",       limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "profile_id",  limit: 4
    t.integer  "category_id", limit: 4
  end

  add_index "exhibits", ["category_id"], name: "index_exhibits_on_category_id", using: :btree
  add_index "exhibits", ["profile_id"], name: "index_exhibits_on_profile_id", using: :btree
  add_index "exhibits", ["user_id"], name: "index_exhibits_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255
    t.string   "lastname",               limit: 255
    t.string   "firstname",              limit: 255
    t.text     "pro_img",                limit: 65535
    t.text     "image_cache",            limit: 65535
    t.text     "introduction",           limit: 65535
    t.integer  "callnumber",             limit: 4
    t.integer  "postalcode",             limit: 4
    t.text     "place",                  limit: 65535
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "exhibits", "categories"
end
