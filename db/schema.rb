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

ActiveRecord::Schema.define(version: 20131122121206) do

  create_table "assets", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.float    "lat"
    t.float    "lng"
    t.float    "speed"
    t.float    "course"
    t.float    "height"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contexts", force: true do |t|
    t.string   "name"
    t.integer  "mission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contexts", ["mission_id"], name: "index_contexts_on_mission_id"

  create_table "geosmaps", force: true do |t|
    t.float    "centerlat"
    t.float    "centerlng"
    t.string   "name"
    t.integer  "zoom"
    t.string   "maptype"
    t.integer  "context_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "geosmaps", ["context_id"], name: "index_geosmaps_on_context_id"

  create_table "mission_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "mission_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "mission_anc_desc_udx", unique: true
  add_index "mission_hierarchies", ["descendant_id"], name: "mission_desc_idx"

  create_table "missions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "people", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.float    "lat"
    t.float    "lng"
    t.float    "speed"
    t.float    "course"
    t.float    "height"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "role_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "role_anc_desc_udx", unique: true
  add_index "role_hierarchies", ["descendant_id"], name: "role_desc_idx"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "enrollable_id"
    t.string   "enrollable_type"
    t.integer  "mission_id"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "head",            default: false
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.float    "lat"
    t.float    "lng"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.float    "lat"
    t.float    "lng"
    t.float    "speed"
    t.float    "course"
    t.float    "height"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
