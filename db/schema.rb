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

ActiveRecord::Schema.define(version: 20171119001903) do

  create_table "payments", force: :cascade do |t|
    t.integer "user_id"
    t.float "value"
    t.integer "subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.integer "tickets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price_units"
    t.string "price_cents"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plan_id"
    t.datetime "expiration"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subscription_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "username"
    t.string "email"
    t.datetime "born_date"
    t.integer "phone", limit: 8
    t.integer "document"
    t.string "password_digest"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
