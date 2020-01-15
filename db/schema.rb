# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_081635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collections_englishes", id: false, force: :cascade do |t|
    t.integer "english_id"
    t.integer "collection_id"
  end

  create_table "collections_russians", id: false, force: :cascade do |t|
    t.integer "russian_id"
    t.integer "collection_id"
  end

  create_table "collections_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "collection_id"
  end

  create_table "englishes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "englishes_russians", id: false, force: :cascade do |t|
    t.integer "russian_id"
    t.integer "english_id"
  end

  create_table "russians", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "user_id"
    t.string "repeat_time", default: "30"
    t.string "sleep_time", default: "20:00"
    t.string "wake_up_time", default: "8:00"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "public", default: true
    t.boolean "email_verified", default: false
    t.string "role", default: "user"
    t.string "password_digest"
    t.string "photo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "devices_ids", default: [], array: true
  end

end
