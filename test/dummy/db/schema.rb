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

ActiveRecord::Schema[7.1].define(version: 2021_06_26_083314) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.integer "users_count"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name", "email"], name: "index_contacts_on_name_and_email"
  end

  create_table "legacy_accounts", primary_key: "uuid", force: :cascade do |t|
    t.string "name"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.integer "project_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["project_id"], name: "index_payments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description_821760"
    t.string "description_894905"
    t.string "description_925884"
    t.string "description_793507"
    t.string "description_716927"
    t.string "description_225695"
    t.string "description_993507"
    t.string "description_746637"
    t.string "description_722954"
    t.string "description_943970"
    t.string "description_607183"
    t.string "description_67050"
    t.string "description_502821"
    t.string "description_366136"
    t.string "description_21974"
    t.string "description_294634"
    t.string "description_880520"
    t.string "description_590228"
    t.string "description_773759"
    t.string "description_86742"
    t.integer "amount_292166"
    t.integer "amount_493450"
    t.integer "amount_778861"
    t.integer "amount_668276"
    t.integer "amount_822299"
    t.integer "amount_822310"
    t.integer "amount_578143"
    t.integer "amount_28292"
    t.integer "amount_553573"
    t.integer "amount_531358"
    t.integer "amount_50446"
    t.integer "amount_181381"
    t.integer "amount_707804"
    t.integer "amount_505524"
    t.integer "amount_457876"
    t.integer "amount_205402"
    t.integer "amount_385340"
    t.integer "amount_197313"
    t.integer "amount_931631"
    t.integer "amount_102892"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
