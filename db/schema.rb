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

ActiveRecord::Schema[7.0].define(version: 2023_02_23_030814) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearance_colors", force: :cascade do |t|
    t.string "color", null: false
    t.bigint "appearance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appearance_id"], name: "index_appearance_colors_on_appearance_id"
  end

  create_table "appearance_impressions", force: :cascade do |t|
    t.string "impression", null: false
    t.bigint "appearance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appearance_id"], name: "index_appearance_impressions_on_appearance_id"
  end

  create_table "appearances", force: :cascade do |t|
    t.string "clarity", null: false
    t.string "brightness", null: false
    t.string "intensity", null: false
    t.string "consistency", null: false
    t.bigint "tasting_sheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasting_sheet_id"], name: "index_appearances_on_tasting_sheet_id"
  end

  create_table "tasting_sheets", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.string "time", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasting_sheets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["uid", "name"], name: "uid_name_users_index", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "appearance_colors", "appearances"
  add_foreign_key "appearance_impressions", "appearances"
  add_foreign_key "appearances", "tasting_sheets"
  add_foreign_key "tasting_sheets", "users"
end
