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

ActiveRecord::Schema.define(version: 20161222164622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
  end

  create_table "borrows", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "friend"
    t.text     "title"
    t.index ["user_id"], name: "index_borrows_on_user_id", using: :btree
  end

  create_table "chats", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.index ["conversation_id"], name: "index_chats_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_chats_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
    t.integer  "user_id"
    t.index ["book_id"], name: "index_conversations_on_book_id", using: :btree
    t.index ["user_id"], name: "index_conversations_on_user_id", using: :btree
  end

  create_table "editions", force: :cascade do |t|
    t.string  "title"
    t.string  "author"
    t.string  "image"
    t.string  "edition"
    t.string  "genre"
    t.integer "numberOfPages"
    t.date    "publicationDate"
    t.string  "publisher"
    t.string  "url"
    t.integer "book_id"
    t.index ["book_id"], name: "index_editions_on_book_id", using: :btree
  end

  create_table "lends", force: :cascade do |t|
    t.integer  "my_book_id"
    t.string   "friend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_book_id"], name: "index_lends_on_my_book_id", using: :btree
  end

  create_table "libraries", force: :cascade do |t|
  end

  create_table "my_books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "edition_id"
    t.integer  "user_id"
    t.index ["edition_id"], name: "index_my_books_on_edition_id", using: :btree
    t.index ["user_id"], name: "index_my_books_on_user_id", using: :btree
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "quote"
    t.integer  "my_book_id"
    t.integer  "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_book_id"], name: "index_quotes_on_my_book_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "my_book_id"
    t.index ["my_book_id"], name: "index_reviews_on_my_book_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "lends", "my_books"
end
