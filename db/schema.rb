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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_124426) do
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

  create_table "conclusions", force: :cascade do |t|
    t.string "evaluation", null: false
    t.string "optimum_temperature", null: false
    t.string "glass", null: false
    t.string "decantage"
    t.string "vintage", null: false
    t.string "country", null: false
    t.string "grape", null: false
    t.bigint "tasting_sheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasting_sheet_id"], name: "index_conclusions_on_tasting_sheet_id"
  end

  create_table "flavor_first_impressions", force: :cascade do |t|
    t.string "first_impression", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flavor_id"], name: "index_flavor_first_impressions_on_flavor_id"
  end

  create_table "flavor_flowers", force: :cascade do |t|
    t.string "flower", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flavor_id"], name: "index_flavor_flowers_on_flavor_id"
  end

  create_table "flavor_fruits", force: :cascade do |t|
    t.string "fruit", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flavor_id"], name: "index_flavor_fruits_on_flavor_id"
  end

  create_table "flavor_impressions", force: :cascade do |t|
    t.string "impression", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flavor_id"], name: "index_flavor_impressions_on_flavor_id"
  end

  create_table "flavor_spices", force: :cascade do |t|
    t.string "spice", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flavor_id"], name: "index_flavor_spices_on_flavor_id"
  end

  create_table "flavors", force: :cascade do |t|
    t.bigint "tasting_sheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasting_sheet_id"], name: "index_flavors_on_tasting_sheet_id"
  end

  create_table "tastes", force: :cascade do |t|
    t.string "attack", null: false
    t.string "sweetness", null: false
    t.string "acidity", null: false
    t.string "bitterness"
    t.string "astringent"
    t.string "balance", null: false
    t.string "alcohol", null: false
    t.string "after_taste", null: false
    t.bigint "tasting_sheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasting_sheet_id"], name: "index_tastes_on_tasting_sheet_id"
  end

  create_table "tasting_sheets", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.string "time", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "wine_id"
    t.index ["user_id"], name: "index_tasting_sheets_on_user_id"
    t.index ["wine_id"], name: "index_tasting_sheets_on_wine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["uid", "name"], name: "uid_name_users_index", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  create_table "wines", force: :cascade do |t|
    t.string "name", null: false
    t.string "vintage", null: false
    t.string "country", null: false
    t.string "region"
    t.string "grape", null: false
    t.string "alcohol_percentage", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  add_foreign_key "appearance_colors", "appearances"
  add_foreign_key "appearance_impressions", "appearances"
  add_foreign_key "appearances", "tasting_sheets"
  add_foreign_key "conclusions", "tasting_sheets"
  add_foreign_key "flavor_first_impressions", "flavors"
  add_foreign_key "flavor_flowers", "flavors"
  add_foreign_key "flavor_fruits", "flavors"
  add_foreign_key "flavor_impressions", "flavors"
  add_foreign_key "flavor_spices", "flavors"
  add_foreign_key "flavors", "tasting_sheets"
  add_foreign_key "tastes", "tasting_sheets"
  add_foreign_key "tasting_sheets", "users"
  add_foreign_key "tasting_sheets", "wines"
end
