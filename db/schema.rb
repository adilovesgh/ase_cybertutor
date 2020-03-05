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

ActiveRecord::Schema.define(version: 20200305061454) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tutor_id"
    t.integer  "student_id"
  end

  add_index "reviews", ["student_id"], name: "index_reviews_on_student_id"
  add_index "reviews", ["tutor_id"], name: "index_reviews_on_tutor_id"

  create_table "reviews_tutors", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews_tutors", ["review_id"], name: "index_reviews_tutors_on_review_id"
  add_index "reviews_tutors", ["tutor_id"], name: "index_reviews_tutors_on_tutor_id"

  create_table "sessions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "tutor_id"
    t.integer  "subject_id"
    t.float    "rate"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["student_id"], name: "index_sessions_on_student_id"
  add_index "sessions", ["subject_id"], name: "index_sessions_on_subject_id"
  add_index "sessions", ["tutor_id"], name: "index_sessions_on_tutor_id"

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "students", ["account_id"], name: "index_students_on_account_id"

  create_table "students_subjects", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students_subjects", ["subject_id"], name: "index_students_subjects_on_subject_id"

  create_table "subject_tutors", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subject_tutors", ["tutor_id"], name: "index_subject_tutors_on_tutor_id"

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "review_id"
  end

  add_index "subjects", ["review_id"], name: "index_subjects_on_review_id"

  create_table "subjects_tutors", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subjects_tutors", ["subject_id"], name: "index_subjects_tutors_on_subject_id"
  add_index "subjects_tutors", ["tutor_id"], name: "index_subjects_tutors_on_tutor_id"

  create_table "tutor_reviews", force: :cascade do |t|
    t.integer  "review_id"
    t.integer  "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tutor_reviews", ["review_id"], name: "index_tutor_reviews_on_review_id"
  add_index "tutor_reviews", ["tutor_id"], name: "index_tutor_reviews_on_tutor_id"

  create_table "tutors", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.integer  "experience"
    t.float    "rate"
    t.float    "average_rating"
    t.integer  "account_id"
  end

  add_index "tutors", ["account_id"], name: "index_tutors_on_account_id"

end
