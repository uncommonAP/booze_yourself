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

ActiveRecord::Schema.define(version: 20171026121031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "abv"
    t.string "img"
    t.string "avg_score"
    t.bigint "user_id"
    t.bigint "brewery_id"
    t.bigint "availability_id"
    t.bigint "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brewery_db_id"
    t.index ["availability_id"], name: "index_beers_on_availability_id"
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
    t.index ["type_id"], name: "index_beers_on_type_id"
    t.index ["user_id"], name: "index_beers_on_user_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.string "brewery_db_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payloads", force: :cascade do |t|
    t.string "beer_name", null: false
    t.string "abv"
    t.string "availability"
    t.text "description"
    t.string "type"
    t.string "brewery_name", null: false
    t.string "brewery_website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "rating", null: false
    t.string "description"
    t.bigint "user_id"
    t.bigint "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_reviews_on_beer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "state", null: false
    t.string "img", default: ""
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
