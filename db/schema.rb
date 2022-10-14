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

ActiveRecord::Schema[7.0].define(version: 2022_10_14_085213) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "content"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_reviews_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.integer "difficulty"
    t.integer "length"
    t.string "starting_city_name"
    t.string "starting_city_zipcode"
    t.string "starting_street_address"
    t.string "ending_city_name"
    t.string "ending_city_zipcode"
    t.string "ending_street_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "short_description"
  end

  add_foreign_key "reviews", "trips"
end
