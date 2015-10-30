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

ActiveRecord::Schema.define(version: 20151028191429) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "users_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["name", "email"], name: "index_contacts_on_name_and_email"

  create_table "legacy_accounts", primary_key: "uuid", force: :cascade do |t|
    t.string "name"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["project_id"], name: "index_payments_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description_322468"
    t.string   "description_95553"
    t.string   "description_21209"
    t.string   "description_513363"
    t.string   "description_766479"
    t.string   "description_975144"
    t.string   "description_969771"
    t.string   "description_119636"
    t.string   "description_531650"
    t.string   "description_895793"
    t.string   "description_13748"
    t.string   "description_314605"
    t.string   "description_510532"
    t.string   "description_720644"
    t.string   "description_92962"
    t.string   "description_497141"
    t.string   "description_77365"
    t.string   "description_79648"
    t.string   "description_764603"
    t.string   "description_545246"
    t.integer  "amount_718718"
    t.integer  "amount_391908"
    t.integer  "amount_993305"
    t.integer  "amount_700336"
    t.integer  "amount_818045"
    t.integer  "amount_85466"
    t.integer  "amount_94983"
    t.integer  "amount_408313"
    t.integer  "amount_230470"
    t.integer  "amount_190661"
    t.integer  "amount_150129"
    t.integer  "amount_420631"
    t.integer  "amount_38683"
    t.integer  "amount_321108"
    t.integer  "amount_689893"
    t.integer  "amount_894341"
    t.integer  "amount_389007"
    t.integer  "amount_903639"
    t.integer  "amount_741556"
    t.integer  "amount_90622"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id"
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.decimal  "salary"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
    t.date     "dob"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["salary"], name: "index_users_on_salary"

end
