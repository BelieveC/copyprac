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

ActiveRecord::Schema.define(version: 20160409065229) do

  create_table "assignments", force: :cascade do |t|
    t.string   "topic"
    t.integer  "subject_id"
    t.integer  "college_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "teacher"
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "practical_id"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["practical_id"], name: "index_comments_on_practical_id"

  create_table "ecomments", force: :cascade do |t|
    t.integer  "examnote_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ecomments", ["examnote_id"], name: "index_ecomments_on_examnote_id"

  create_table "examnotes", force: :cascade do |t|
    t.string   "subject"
    t.string   "topic"
    t.string   "tips"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "college_id"
    t.integer  "subject_id"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "sheet_file_name"
    t.string   "sheet_content_type"
    t.integer  "sheet_file_size"
    t.datetime "sheet_updated_at"
    t.integer  "practical_id"
  end

  add_index "images", ["practical_id"], name: "index_images_on_practical_id"

  create_table "notes", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "page_file_name"
    t.string   "page_content_type"
    t.integer  "page_file_size"
    t.datetime "page_updated_at"
    t.integer  "examnote_id"
  end

  add_index "notes", ["examnote_id"], name: "index_notes_on_examnote_id"

  create_table "practicals", force: :cascade do |t|
    t.string   "aim"
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "college_id"
    t.integer  "subject_id"
  end

  create_table "qpapers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tcomments", force: :cascade do |t|
    t.integer  "thesis_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tcomments", ["thesis_id"], name: "index_tcomments_on_thesis_id"

  create_table "theses", force: :cascade do |t|
    t.string   "topic"
    t.string   "reasearchers"
    t.string   "subject"
    t.string   "duration"
    t.string   "publisher"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "subject_id"
  end

  create_table "thesisimages", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "paper_file_name"
    t.string   "paper_content_type"
    t.integer  "paper_file_size"
    t.datetime "paper_updated_at"
    t.integer  "thesis_id"
  end

  add_index "thesisimages", ["thesis_id"], name: "index_thesisimages_on_thesis_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
