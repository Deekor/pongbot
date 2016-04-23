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

ActiveRecord::Schema.define(version: 20160423060637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matchups", force: :cascade do |t|
    t.integer  "player_one_id"
    t.integer  "player_two_id"
    t.integer  "player_one_score", default: 0
    t.integer  "player_two_score", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "matchups", ["player_one_id"], name: "index_matchups_on_player_one_id", using: :btree
  add_index "matchups", ["player_one_score"], name: "index_matchups_on_player_one_score", using: :btree
  add_index "matchups", ["player_two_id"], name: "index_matchups_on_player_two_id", using: :btree
  add_index "matchups", ["player_two_score"], name: "index_matchups_on_player_two_score", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "slack_id"
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
