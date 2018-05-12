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

ActiveRecord::Schema.define(version: 2017_01_26_124628) do

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
    t.string "description_245592"
    t.string "description_450580"
    t.string "description_183349"
    t.string "description_341325"
    t.string "description_277196"
    t.string "description_943405"
    t.string "description_904897"
    t.string "description_267877"
    t.string "description_47807"
    t.string "description_713494"
    t.string "description_696562"
    t.string "description_976508"
    t.string "description_918800"
    t.string "description_27002"
    t.string "description_393763"
    t.string "description_960166"
    t.string "description_804457"
    t.string "description_684568"
    t.string "description_98716"
    t.string "description_337791"
    t.integer "amount_584190"
    t.integer "amount_898177"
    t.integer "amount_599511"
    t.integer "amount_308345"
    t.integer "amount_572259"
    t.integer "amount_562080"
    t.integer "amount_684853"
    t.integer "amount_77648"
    t.integer "amount_377109"
    t.integer "amount_246825"
    t.integer "amount_91844"
    t.integer "amount_787673"
    t.integer "amount_158730"
    t.integer "amount_331843"
    t.integer "amount_540084"
    t.integer "amount_780019"
    t.integer "amount_745694"
    t.integer "amount_715202"
    t.integer "amount_887110"
    t.integer "amount_607339"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
