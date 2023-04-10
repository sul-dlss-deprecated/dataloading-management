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

ActiveRecord::Schema[7.0].define(version: 2023_04_10_144318) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dataload_jobs", force: :cascade do |t|
    t.bigint "vendor_id"
    t.integer "status", default: 0, null: false
    t.integer "recurrence", default: 0, null: false
    t.boolean "enabled", default: true, null: false
    t.datetime "date"
    t.string "dataload_profile_id", null: false
    t.string "created_by", null: false
    t.jsonb "additional_contacts", default: [], null: false
    t.string "filename"
    t.string "file_pattern"
    t.jsonb "processing_tasks", default: [], null: false
    t.text "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "interface_id"
    t.index ["vendor_id"], name: "index_dataload_jobs_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "folio_id", null: false
    t.string "folio_code", null: false
    t.string "name", null: false
    t.boolean "highlight", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folio_id"], name: "index_vendors_on_folio_id", unique: true
  end

  add_foreign_key "dataload_jobs", "vendors"
end
