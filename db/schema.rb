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

ActiveRecord::Schema.define(version: 2020_02_21_222523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.integer "coins"
    t.integer "duration"
    t.integer "participant_number"
    t.integer "failed_number"
    t.datetime "deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pic_link"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "challenge_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "challenge_id"
    t.integer "continuous_check_in"
    t.boolean "finished"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participate_ins", force: :cascade do |t|
    t.integer "user_id"
    t.integer "challenge_id"
    t.integer "continuous_check_in"
    t.boolean "failed"
    t.boolean "finished"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "coins"
    t.integer "chechin_number"
    t.integer "challenge_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
