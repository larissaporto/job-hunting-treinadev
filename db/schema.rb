# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_28_200613) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applicants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

  create_table "applies", force: :cascade do |t|
    t.integer "job_id"
    t.integer "profile_id"
    t.text "cover_letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mark", default: 0
    t.integer "applicant_status", default: 0
    t.index ["job_id"], name: "index_applies_on_job_id"
    t.index ["profile_id"], name: "index_applies_on_profile_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "body"
    t.integer "apply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apply_id"], name: "index_feedbacks_on_apply_id"
  end

  create_table "headhunters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_headhunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_headhunters_on_reset_password_token", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "skills"
    t.decimal "salary_from"
    t.decimal "salary_to"
    t.date "end_date"
    t.string "where"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_level", default: 0
    t.integer "headhunter_id"
    t.integer "status", default: 0
    t.index ["headhunter_id"], name: "index_jobs_on_headhunter_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "social_name"
    t.date "birth_date"
    t.integer "qualification", default: 0
    t.text "description"
    t.text "experience"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "condition", default: 0
    t.index ["applicant_id"], name: "index_profiles_on_applicant_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.date "start_date"
    t.decimal "salary"
    t.string "position"
    t.text "job_details"
    t.string "benefits"
    t.decimal "bonus"
    t.text "addicional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "apply_id"
    t.index ["apply_id"], name: "index_proposals_on_apply_id"
  end

end
