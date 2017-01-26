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

ActiveRecord::Schema.define(version: 20170126124628) do

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
    t.string   "description_579223"
    t.string   "description_345401"
    t.string   "description_422932"
    t.string   "description_70065"
    t.string   "description_482605"
    t.string   "description_940447"
    t.string   "description_740033"
    t.string   "description_671952"
    t.string   "description_596531"
    t.string   "description_86379"
    t.string   "description_677943"
    t.string   "description_811919"
    t.string   "description_46326"
    t.string   "description_871123"
    t.string   "description_308496"
    t.string   "description_725688"
    t.string   "description_630564"
    t.string   "description_529706"
    t.string   "description_580432"
    t.string   "description_135352"
    t.integer  "amount_148947"
    t.integer  "amount_389744"
    t.integer  "amount_957940"
    t.integer  "amount_236149"
    t.integer  "amount_507850"
    t.integer  "amount_892431"
    t.integer  "amount_362618"
    t.integer  "amount_275585"
    t.integer  "amount_577887"
    t.integer  "amount_125612"
    t.integer  "amount_510527"
    t.integer  "amount_302316"
    t.integer  "amount_505272"
    t.integer  "amount_339402"
    t.integer  "amount_23870"
    t.integer  "amount_730520"
    t.integer  "amount_770590"
    t.integer  "amount_242937"
    t.integer  "amount_825518"
    t.integer  "amount_490791"
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
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "account_id"
    t.date     "dob"
    t.boolean  "active",     default: true
    t.string   "type"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["salary"], name: "index_users_on_salary"

end
