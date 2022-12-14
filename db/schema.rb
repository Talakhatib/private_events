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

ActiveRecord::Schema[7.0].define(version: 2022_12_02_105116) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attend_events", force: :cascade do |t|
    t.integer "attendee_id"
    t.integer "attended_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attended_event_id"], name: "index_attend_events_on_attended_event_id"
    t.index ["attendee_id", "attended_event_id"], name: "index_attend_events_on_attendee_id_and_attended_event_id", unique: true
    t.index ["attendee_id"], name: "index_attend_events_on_attendee_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "event_categories", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_event_categories_on_category_id"
    t.index ["event_id"], name: "index_event_categories_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "event_date"
    t.string "location"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "inviter_id"
    t.integer "invited_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "email"
    t.string "phone"
    t.date "date_of_birth"
    t.string "address"
  end

  add_foreign_key "categories", "users"
  add_foreign_key "event_categories", "categories"
  add_foreign_key "event_categories", "events"
end
