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

ActiveRecord::Schema[7.0].define(version: 2023_02_16_151501) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "log_date", null: false
    t.integer "study_number", null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "memos", force: :cascade do |t|
    t.text "body"
    t.integer "user_id", null: false
    t.integer "study_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_memos_on_study_id"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "studies", force: :cascade do |t|
    t.string "title", null: false
    t.date "start_day", null: false
    t.string "day_of_week", null: false
    t.integer "total_number", null: false
    t.integer "start_number", null: false
    t.integer "end_number", null: false
    t.integer "target_number", null: false
    t.string "url"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studies_on_user_id"
  end

  create_table "study_logs", force: :cascade do |t|
    t.integer "study_id", null: false
    t.integer "log_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_id"], name: "index_study_logs_on_log_id"
    t.index ["study_id"], name: "index_study_logs_on_study_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "logs", "users"
  add_foreign_key "memos", "studies"
  add_foreign_key "memos", "users"
  add_foreign_key "studies", "users"
  add_foreign_key "study_logs", "logs"
  add_foreign_key "study_logs", "studies"
end
