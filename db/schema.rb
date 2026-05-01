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

ActiveRecord::Schema[8.1].define(version: 2026_05_01_234021) do
  create_table "events", force: :cascade do |t|
    t.integer "available_capacity"
    t.string "category"
    t.datetime "created_at", null: false
    t.string "description"
    t.datetime "end_date"
    t.integer "lifecycle_stage"
    t.integer "maximum_capacity"
    t.integer "organizer_id", null: false
    t.datetime "start_date"
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "venue"
    t.index ["organizer_id"], name: "index_events_on_organizer_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "event_id", null: false
    t.datetime "registered_at"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["event_id"], name: "index_registrations_on_event_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "administrator_id", null: false
    t.float "calification"
    t.string "comment"
    t.datetime "created_at", null: false
    t.integer "event_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["administrator_id"], name: "index_reviews_on_administrator_id"
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.integer "role", default: 0
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "users", column: "organizer_id"
  add_foreign_key "registrations", "events"
  add_foreign_key "registrations", "users"
  add_foreign_key "reviews", "administrators"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "users"
end
