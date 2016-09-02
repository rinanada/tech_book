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

ActiveRecord::Schema.define(version: 20160902104423) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "buyings", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
    t.integer  "profile_id", limit: 4
  end

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
    t.integer  "user_id",     limit: 4
    t.integer  "buying_id",   limit: 4
    t.integer  "category_id", limit: 4
    t.integer  "profiles_id", limit: 4
    t.string   "title",       limit: 255
    t.string   "sub_title",   limit: 255
    t.integer  "price",       limit: 4
    t.integer  "state",       limit: 4
    t.text     "discription", limit: 65535
    t.text     "content",     limit: 65535
  end

  add_index "exhibits", ["buying_id"], name: "index_exhibits_on_buying_id", using: :btree
  add_index "exhibits", ["category_id"], name: "index_exhibits_on_category_id", using: :btree
  add_index "exhibits", ["profiles_id"], name: "index_exhibits_on_profiles_id", using: :btree
  add_index "exhibits", ["user_id"], name: "index_exhibits_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "user_details", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastname",   limit: 255
    t.string   "firstname",  limit: 255
    t.integer  "postalcode", limit: 4
    t.integer  "callnumber", limit: 4
    t.integer  "place",      limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id", using: :btree

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
    t.text     "pro_img",                limit: 65535
    t.text     "image_cache",            limit: 65535
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "buyings", "profiles"
  add_foreign_key "user_details", "users"
end
