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

ActiveRecord::Schema.define(version: 20160422130811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "deposits", ["user_id"], name: "index_deposits_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  add_index "payments", ["product_id"], name: "index_payments_on_product_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",                   precision: 8, scale: 2
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "cached_votes_total",                              default: 0
    t.integer  "cached_votes_score",                              default: 0
    t.integer  "cached_votes_up",                                 default: 0
    t.integer  "cached_votes_down",                               default: 0
    t.integer  "cached_weighted_score",                           default: 0
    t.integer  "cached_weighted_total",                           default: 0
    t.float    "cached_weighted_average",                         default: 0.0
    t.integer  "on_stock"
    t.string   "avatar"
  end

  add_index "products", ["cached_votes_down"], name: "index_products_on_cached_votes_down", using: :btree
  add_index "products", ["cached_votes_score"], name: "index_products_on_cached_votes_score", using: :btree
  add_index "products", ["cached_votes_total"], name: "index_products_on_cached_votes_total", using: :btree
  add_index "products", ["cached_votes_up"], name: "index_products_on_cached_votes_up", using: :btree
  add_index "products", ["cached_weighted_average"], name: "index_products_on_cached_weighted_average", using: :btree
  add_index "products", ["cached_weighted_score"], name: "index_products_on_cached_weighted_score", using: :btree
  add_index "products", ["cached_weighted_total"], name: "index_products_on_cached_weighted_total", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                           default: "",    null: false
    t.string   "encrypted_password",                              default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.boolean  "admin",                                           default: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "avatar"
    t.decimal  "cash_amount",            precision: 10, scale: 2, default: 0.0
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "deposits", "users"
  add_foreign_key "payments", "products"
  add_foreign_key "payments", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
