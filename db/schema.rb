# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20200329203951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tutor_id"
    t.integer  "student_id"
  end

  add_index "reviews", ["student_id"], name: "index_reviews_on_student_id", using: :btree
  add_index "reviews", ["tutor_id"], name: "index_reviews_on_tutor_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "tutor_id"
    t.integer  "subject_id"
    t.float    "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "sessions", ["student_id"], name: "index_sessions_on_student_id", using: :btree
  add_index "sessions", ["subject_id"], name: "index_sessions_on_subject_id", using: :btree
  add_index "sessions", ["tutor_id"], name: "index_sessions_on_tutor_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "students", ["account_id"], name: "index_students_on_account_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "review_id"
  end

  add_index "subjects", ["review_id"], name: "index_subjects_on_review_id", using: :btree

  create_table "subjects_tutors", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subjects_tutors", ["subject_id"], name: "index_subjects_tutors_on_subject_id", using: :btree
  add_index "subjects_tutors", ["tutor_id"], name: "index_subjects_tutors_on_tutor_id", using: :btree

  create_table "tutors", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "experience"
    t.float    "average_rating"
    t.integer  "account_id"
    t.float    "rate"
    t.string   "precision"
  end

  add_index "tutors", ["account_id"], name: "index_tutors_on_account_id", using: :btree

  add_foreign_key "reviews", "students"
  add_foreign_key "reviews", "tutors"
  add_foreign_key "sessions", "students"
  add_foreign_key "sessions", "subjects"
  add_foreign_key "sessions", "tutors"
  add_foreign_key "students", "accounts"
  add_foreign_key "subjects", "reviews"
  add_foreign_key "subjects_tutors", "subjects"
  add_foreign_key "subjects_tutors", "tutors"
  add_foreign_key "tutors", "accounts"
end
