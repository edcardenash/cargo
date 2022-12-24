# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_24_201706) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "freights", force: :cascade do |t|
    t.float "start_latitude"
    t.float "start_longitude"
    t.float "end_latitude"
    t.float "end_logitude"
    t.text "description"
    t.datetime "start_date"
    t.text "receiver_name"
    t.text "receiver_phone"
    t.boolean "round_trip"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_freights_on_user_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "status"
    t.float "amount"
    t.text "comment"
    t.bigint "vehicle_id", null: false
    t.bigint "freight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freight_id"], name: "index_quotes_on_freight_id"
    t.index ["vehicle_id"], name: "index_quotes_on_vehicle_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "commnent"
    t.float "rating"
    t.bigint "quote_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_id"], name: "index_reviews_on_quote_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "first_name"
    t.text "last_name"
    t.text "phone"
    t.text "address"
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.text "address"
    t.float "longitude"
    t.float "latitude"
    t.text "license_plate"
    t.text "vehicle_type"
    t.text "description"
    t.boolean "covered"
    t.float "load_capacity"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "cities", "regions"
  add_foreign_key "freights", "users"
  add_foreign_key "quotes", "freights"
  add_foreign_key "quotes", "vehicles"
  add_foreign_key "regions", "countries"
  add_foreign_key "reviews", "quotes"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "vehicles", "users"
end
