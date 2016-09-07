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

ActiveRecord::Schema.define(version: 20160906093907) do

  create_table "aircrafts", force: :cascade do |t|
    t.string   "craft_no"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airfares", force: :cascade do |t|
    t.integer  "route_id"
    t.decimal  "service_charge"
    t.string   "tax"
    t.integer  "class_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["class_id"], name: "index_airfares_on_class_id"
    t.index ["route_id"], name: "index_airfares_on_route_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_airports_on_state_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "booking_ref"
    t.integer  "user_id"
    t.integer  "flight_id"
    t.boolean  "checked_in"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "departure_date"
    t.time     "arrival_time"
    t.integer  "aircraft_id"
    t.integer  "airfare_id"
    t.integer  "route_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["aircraft_id"], name: "index_flights_on_aircraft_id"
    t.index ["airfare_id"], name: "index_flights_on_airfare_id"
    t.index ["route_id"], name: "index_flights_on_route_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "first_name",  limit: 30
    t.string   "last_name",   limit: 30
    t.string   "phone",       limit: 16
    t.string   "passport_no", limit: 15
    t.integer  "user_id"
    t.integer  "booking_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.integer  "airport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_routes_on_airport_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "iata_code"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "passenger_id"
    t.datetime "booking_date"
    t.integer  "airfare_id"
    t.string   "transaction_ref"
    t.integer  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["airfare_id"], name: "index_transactions_on_airfare_id"
    t.index ["flight_id"], name: "index_transactions_on_flight_id"
    t.index ["passenger_id"], name: "index_transactions_on_passenger_id"
  end

  create_table "travel_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name",      limit: 30
    t.string "last_name",       limit: 30
    t.string "email"
    t.string "picture_url",     limit: 40
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_digest"], name: "index_users_on_remember_digest"
  end

end
