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

ActiveRecord::Schema.define(version: 20131024135059) do

  create_table "addresses", force: true do |t|
    t.integer  "publication_id"
    t.integer  "department_id"
    t.integer  "person_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "departments", force: true do |t|
    t.string   "sv_name"
    t.string   "en_name"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "languages", force: true do |t|
    t.string   "sv_name"
    t.string   "en_name"
    t.string   "iso"
    t.integer  "priority"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "people", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.integer  "birthyear"
    t.datetime "publist_verify_date"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "publication_data", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "publication_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "publication_meta_data", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "publication_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "publication_types", force: true do |t|
    t.string   "sv_name"
    t.string   "en_name"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "publications", force: true do |t|
    t.integer  "pubid"
    t.string   "title"
    t.integer  "publication_type_id"
    t.integer  "language_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

end
