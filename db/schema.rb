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

ActiveRecord::Schema[7.1].define(version: 2024_05_30_004540) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "batches", force: :cascade do |t|
    t.integer "voice"
    t.string "font_family"
    t.integer "font_size"
    t.string "font_style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "source_id", null: false
    t.index ["source_id"], name: "index_batches_on_source_id"
  end

  create_table "outputs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "source_id", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "script"
    t.integer "voice"
    t.string "font_family"
    t.integer "font_size"
    t.string "font_style"
    t.bigint "batch_id", null: false
    t.string "suggested_title"
    t.string "suggested_description"
    t.string "suggested_hashtags"
    t.index ["batch_id"], name: "index_outputs_on_batch_id"
    t.index ["source_id"], name: "index_outputs_on_source_id"
    t.index ["user_id"], name: "index_outputs_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "publish_time"
    t.bigint "output_id", null: false
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["output_id"], name: "index_schedules_on_output_id"
  end

  create_table "sources", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "location"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "batches", "sources"
  add_foreign_key "outputs", "batches"
  add_foreign_key "outputs", "sources"
  add_foreign_key "outputs", "users"
  add_foreign_key "schedules", "outputs"
end
