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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_143325) do
  create_table "bus_lines", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "serial"
    t.string "audio_url"
    t.string "image_url"
    t.integer "title_id"
  end

  create_table "bus_schedules", force: :cascade do |t|
    t.integer "departure_hour"
    t.integer "departure_minute"
    t.integer "bus_line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer "serial"
    t.string "image"
    t.string "audio"
    t.integer "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "karuta", force: :cascade do |t|
    t.integer "serial"
    t.integer "title_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "audio"
    t.string "image"
    t.index ["title_id"], name: "index_karuta_on_title_id"
  end

  create_table "players", force: :cascade do |t|
    t.text "name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "situation"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "serial"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "karuta", "titles"
end
