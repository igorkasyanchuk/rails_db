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

ActiveRecord::Schema.define(version: 20180528134358) do

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.integer "users_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "email"], name: "index_contacts_on_name_and_email"
  end

  create_table "legacy_accounts", primary_key: "uuid", force: :cascade do |t|
    t.string "name"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_payments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description_492106"
    t.string "description_200949"
    t.string "description_180665"
    t.string "description_806273"
    t.string "description_93256"
    t.string "description_191220"
    t.string "description_147227"
    t.string "description_18924"
    t.string "description_280694"
    t.string "description_398815"
    t.string "description_552891"
    t.string "description_30028"
    t.string "description_492900"
    t.string "description_925333"
    t.string "description_418541"
    t.string "description_703855"
    t.string "description_25680"
    t.string "description_273217"
    t.string "description_235296"
    t.string "description_398291"
    t.integer "amount_723167"
    t.integer "amount_973995"
    t.integer "amount_10079"
    t.integer "amount_478676"
    t.integer "amount_293483"
    t.integer "amount_99616"
    t.integer "amount_449220"
    t.integer "amount_715853"
    t.integer "amount_235541"
    t.integer "amount_427091"
    t.integer "amount_782579"
    t.integer "amount_358029"
    t.integer "amount_930716"
    t.integer "amount_27449"
    t.integer "amount_935730"
    t.integer "amount_545041"
    t.integer "amount_81780"
    t.integer "amount_206186"
    t.integer "amount_68814"
    t.integer "amount_962381"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_projects_on_deleted_at"
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.index ["project_id"], name: "index_projects_users_on_project_id"
    t.index ["user_id"], name: "index_projects_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.decimal "salary"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.date "dob"
    t.boolean "active", default: true
    t.string "type"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["name"], name: "index_users_on_name"
    t.index ["salary"], name: "index_users_on_salary"
  end

end
