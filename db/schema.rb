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

ActiveRecord::Schema.define(version: 20160710145205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "citext"
  enable_extension "uuid-ossp"
  enable_extension "unaccent"

  create_table "api_keys", force: :cascade do |t|
    t.citext   "key",        :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end
  add_index "api_keys", ["key"], :name=>"index_api_keys_on_key", :using=>:btree

  create_table "visitations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "visitor_id", :null=>false
    t.citext   "address",    :null=>false
    t.datetime "time",       :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end
  add_index "visitations", ["address"], :name=>"index_visitations_on_address", :using=>:btree
  add_index "visitations", ["visitor_id"], :name=>"index_visitations_on_visitor_id", :using=>:btree

  create_table "visitors", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.citext   "email",      :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end
  add_index "visitors", ["email"], :name=>"index_visitors_on_email", :unique=>true, :using=>:btree

end
