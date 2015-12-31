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

ActiveRecord::Schema.define(version: 20151121125538) do

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
    t.string   "description_911132"
    t.string   "description_782996"
    t.string   "description_824956"
    t.string   "description_241581"
    t.string   "description_725539"
    t.string   "description_340145"
    t.string   "description_243765"
    t.string   "description_430455"
    t.string   "description_163298"
    t.string   "description_670015"
    t.string   "description_64256"
    t.string   "description_825795"
    t.string   "description_130920"
    t.string   "description_546951"
    t.string   "description_678246"
    t.string   "description_372493"
    t.string   "description_413167"
    t.string   "description_399716"
    t.string   "description_605912"
    t.string   "description_179385"
    t.integer  "amount_346083"
    t.integer  "amount_295343"
    t.integer  "amount_478538"
    t.integer  "amount_356409"
    t.integer  "amount_798898"
    t.integer  "amount_300244"
    t.integer  "amount_963504"
    t.integer  "amount_83801"
    t.integer  "amount_272106"
    t.integer  "amount_852037"
    t.integer  "amount_35283"
    t.integer  "amount_803382"
    t.integer  "amount_218786"
    t.integer  "amount_230333"
    t.integer  "amount_357044"
    t.integer  "amount_984738"
    t.integer  "amount_172195"
    t.integer  "amount_249998"
    t.integer  "amount_349304"
    t.integer  "amount_792944"
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
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["salary"], name: "index_users_on_salary"

end
