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

ActiveRecord::Schema.define(version: 20160422145942) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "batches", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "description"
    t.text     "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "college_id"
    t.text     "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "branch_id"
    t.integer  "subject_id"
  end

  create_table "fee_receipts", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "semester_id"
    t.date     "date"
    t.integer  "receipt_no"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fees", force: :cascade do |t|
    t.integer  "tution_fee"
    t.integer  "bus_fee"
    t.integer  "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "grade"
    t.integer  "points"
    t.integer  "subject_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "grade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "student_id"
    t.integer  "semester_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "enrollment"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "college_id"
    t.integer  "semester_id",       default: 1
    t.integer  "branch_id"
    t.integer  "batch_id"
    t.date     "dateofbirth"
    t.string   "father_name"
    t.string   "mothe_name"
    t.string   "phone"
    t.text     "current_address"
    t.text     "permanent_address"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true

  create_table "subject_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "semester_id"
    t.integer  "syllabus_id"
    t.integer  "subject_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "branch_id"
  end

  create_table "syllabuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
