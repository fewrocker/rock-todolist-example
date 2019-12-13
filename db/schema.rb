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

ActiveRecord::Schema.define(version: 2019_12_13_190606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "message"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_contacts_on_session_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "int"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", default: "default"
    t.string "description", default: "default"
    t.string "thumbnail", default: "default"
    t.string "content", default: "default"
    t.string "slug", default: ""
    t.string "draft", default: ""
    t.datetime "draft_saved_at"
    t.datetime "published_at"
    t.datetime "retired_at"
    t.string "retire_reason"
    t.integer "featured"
    t.bigint "category_id"
    t.bigint "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["level_id"], name: "index_posts_on_level_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "reader_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.boolean "admin", default: false
    t.datetime "finished_at"
    t.bigint "reader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reader_id"], name: "index_sessions_on_reader_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "finished_at"
    t.integer "claps", default: 0
    t.bigint "session_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_visits_on_post_id"
    t.index ["session_id"], name: "index_visits_on_session_id"
  end

  add_foreign_key "contacts", "sessions"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "levels"
  add_foreign_key "sessions", "readers"
  add_foreign_key "visits", "posts"
  add_foreign_key "visits", "sessions"
end
