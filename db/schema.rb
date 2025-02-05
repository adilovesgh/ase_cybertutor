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

ActiveRecord::Schema.define(version: 20200508032111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "email"
    t.string   "password_digest"
    t.integer  "price_cents",     default: 0, null: false
    t.integer  "notification"
    t.boolean  "is_reviewer"
    t.boolean  "admin"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "conversations", ["recipient_id", "sender_id"], name: "index_conversations_on_recipient_id_and_sender_id", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "account_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["account_id"], name: "index_messages_on_account_id", using: :btree
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "session_id"
    t.integer  "account_id"
    t.integer  "status"
    t.string   "token"
    t.string   "charge_id"
    t.string   "error_message"
    t.string   "customer_id"
    t.integer  "payment_gateway"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_cents",     default: 0, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tutor_id"
    t.integer  "student_id"
    t.integer  "session_id"
  end

  add_index "requests", ["session_id"], name: "index_requests_on_session_id", using: :btree
  add_index "requests", ["student_id"], name: "index_requests_on_student_id", using: :btree
  add_index "requests", ["tutor_id"], name: "index_requests_on_tutor_id", using: :btree

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
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "pending"
    t.boolean  "verified"
    t.string   "stripe_plan_name"
    t.string   "paypal_plan_name"
    t.integer  "price_cents",      default: 0,     null: false
    t.string   "price_currency",   default: "USD", null: false
    t.boolean  "seen"
    t.boolean  "seen_student"
    t.string   "whiteboard_id"
    t.boolean  "completed"
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

  create_table "tutor_requests", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tutor_requests", ["subject_id"], name: "index_tutor_requests_on_subject_id", using: :btree
  add_index "tutor_requests", ["tutor_id"], name: "index_tutor_requests_on_tutor_id", using: :btree

  create_table "tutors", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "experience"
    t.float    "average_rating"
    t.integer  "account_id"
    t.integer  "price_cents",    default: 0, null: false
    t.string   "precision"
    t.float    "rake"
  end

  add_index "tutors", ["account_id"], name: "index_tutors_on_account_id", using: :btree

  add_foreign_key "messages", "accounts"
  add_foreign_key "messages", "conversations"
  add_foreign_key "requests", "sessions"
  add_foreign_key "requests", "students"
  add_foreign_key "requests", "tutors"
  add_foreign_key "reviews", "students"
  add_foreign_key "reviews", "tutors"
  add_foreign_key "sessions", "students"
  add_foreign_key "sessions", "subjects"
  add_foreign_key "sessions", "tutors"
  add_foreign_key "students", "accounts"
  add_foreign_key "subjects", "reviews"
  add_foreign_key "subjects_tutors", "subjects"
  add_foreign_key "subjects_tutors", "tutors"
  add_foreign_key "tutor_requests", "subjects"
  add_foreign_key "tutor_requests", "tutors"
  add_foreign_key "tutors", "accounts"
end
