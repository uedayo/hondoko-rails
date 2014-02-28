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

ActiveRecord::Schema.define(version: 20140228162038) do

  create_table "areas", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "asin"
    t.string   "title"
    t.string   "author"
    t.string   "manufacturer"
    t.string   "publication_date"
    t.string   "small_image"
    t.string   "medium_image"
    t.string   "large_image"
    t.integer  "price"
    t.string   "currency"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree

  create_table "browses", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "browses", ["book_id"], name: "index_browses_on_book_id", using: :btree
  add_index "browses", ["search_id"], name: "index_browses_on_search_id", using: :btree
  add_index "browses", ["user_id"], name: "index_browses_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_ins", force: true do |t|
    t.integer  "check_out_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "check_ins", ["check_out_id"], name: "index_check_ins_on_check_out_id", using: :btree

  create_table "check_outs", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "check_outs", ["item_id"], name: "index_check_outs_on_item_id", using: :btree
  add_index "check_outs", ["user_id"], name: "index_check_outs_on_user_id", using: :btree

  create_table "divisions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "book_id"
    t.integer  "volume"
    t.integer  "area_id"
    t.integer  "donor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["area_id"], name: "index_items_on_area_id", using: :btree
  add_index "items", ["book_id"], name: "index_items_on_book_id", using: :btree

  create_table "search_words", force: true do |t|
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.integer  "user_id"
    t.integer  "search_word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "searches", ["search_word_id"], name: "index_searches_on_search_word_id", using: :btree
  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "screen_name"
    t.string   "last_name_kanji"
    t.string   "first_name_kanji"
    t.string   "last_name_hiragana"
    t.string   "first_name_hiragana"
    t.string   "email"
    t.string   "image_url"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["division_id"], name: "index_users_on_division_id", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
