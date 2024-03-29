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

ActiveRecord::Schema.define(version: 20170413094716) do

  create_table "answers", force: :cascade do |t|
    t.string   "body",        null: false
    t.integer  "question_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token",                null: false
    t.boolean  "active",       default: true, null: false
    t.integer  "tenant_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "api_keys", ["tenant_id"], name: "index_api_keys_on_tenant_id"

  create_table "questions", force: :cascade do |t|
    t.string   "title",                      null: false
    t.boolean  "private",    default: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "api_key",                   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "request_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
