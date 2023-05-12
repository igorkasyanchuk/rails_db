# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_26_083314) do

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
    t.string "description_214636"
    t.string "description_881927"
    t.string "description_377910"
    t.string "description_787561"
    t.string "description_397939"
    t.string "description_427609"
    t.string "description_70125"
    t.string "description_68088"
    t.string "description_211155"
    t.string "description_915979"
    t.string "description_198834"
    t.string "description_669085"
    t.string "description_771"
    t.string "description_519606"
    t.string "description_500107"
    t.string "description_277668"
    t.string "description_706655"
    t.string "description_617984"
    t.string "description_312370"
    t.string "description_239866"
    t.integer "amount_777579"
    t.integer "amount_886090"
    t.integer "amount_11955"
    t.integer "amount_494653"
    t.integer "amount_666834"
    t.integer "amount_297923"
    t.integer "amount_458470"
    t.integer "amount_339355"
    t.integer "amount_539001"
    t.integer "amount_209067"
    t.integer "amount_74088"
    t.integer "amount_736364"
    t.integer "amount_685429"
    t.integer "amount_506310"
    t.integer "amount_440103"
    t.integer "amount_418280"
    t.integer "amount_60289"
    t.integer "amount_433505"
    t.integer "amount_160749"
    t.integer "amount_723751"
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
    t.string "country"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["name"], name: "index_users_on_name"
    t.index ["salary"], name: "index_users_on_salary"
  end

end
