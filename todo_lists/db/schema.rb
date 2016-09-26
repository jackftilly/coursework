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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160808234028) do
=======
ActiveRecord::Schema.define(version: 20160824182701) do
>>>>>>> old_i/master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "comments", force: :cascade do |t|
    t.string   "body",             null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.text     "body",                       null: false
    t.boolean  "complete",   default: false
    t.boolean  "private",    default: false
=======
  create_table "todos", force: :cascade do |t|
    t.string   "title",                      null: false
    t.text     "body",                       null: false
    t.boolean  "done",       default: false, null: false
>>>>>>> old_i/master
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

<<<<<<< HEAD
  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "session_token",   null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

=======
>>>>>>> old_i/master
end
