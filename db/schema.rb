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

ActiveRecord::Schema.define(version: 20170913175121) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "current",    default: true
    t.datetime "start_date"
    t.datetime "end_date"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "daily_grades", force: :cascade do |t|
    t.integer  "attendance"
    t.integer  "homework"
    t.integer  "quiz"
    t.string   "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "participation"
    t.integer  "exam"
    t.datetime "classdate"
    t.integer  "semester_id"
  end

  add_index "daily_grades", ["semester_id"], name: "index_daily_grades_on_semester_id"

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
  end

  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id"

  create_table "holidays", force: :cascade do |t|
    t.datetime "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "semesters", ["student_id"], name: "index_semesters_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "nickname"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "family_name"
    t.string   "given_name"
    t.integer  "daily_grades_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
