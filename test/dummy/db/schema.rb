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
  create_table "accounts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "users_count"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "contacts", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name", "email"], name: "index_contacts_on_name_and_email"
  end

  create_table "legacy_accounts", primary_key: "uuid", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
  end

  create_table "payments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "amount", precision: 10
    t.integer "project_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["project_id"], name: "index_payments_on_project_id"
  end

  create_table "projects", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description_524218"
    t.string "description_582477"
    t.string "description_910553"
    t.string "description_181360"
    t.string "description_637048"
    t.string "description_920060"
    t.string "description_125376"
    t.string "description_72387"
    t.string "description_457825"
    t.string "description_858192"
    t.string "description_292867"
    t.string "description_986009"
    t.string "description_293297"
    t.string "description_733485"
    t.string "description_248137"
    t.string "description_273482"
    t.string "description_520504"
    t.string "description_785302"
    t.string "description_224435"
    t.string "description_235085"
    t.integer "amount_97144"
    t.integer "amount_116203"
    t.integer "amount_394760"
    t.integer "amount_542072"
    t.integer "amount_986307"
    t.integer "amount_571123"
    t.integer "amount_344510"
    t.integer "amount_434757"
    t.integer "amount_728495"
    t.integer "amount_878167"
    t.integer "amount_518288"
    t.integer "amount_767100"
    t.integer "amount_119368"
    t.integer "amount_793397"
    t.integer "amount_206014"
    t.integer "amount_693084"
    t.integer "amount_230674"
    t.integer "amount_341979"
    t.integer "amount_466015"
    t.integer "amount_128321"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.index ["deleted_at"], name: "index_projects_on_deleted_at"
  end

  create_table "projects_users", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.index ["project_id"], name: "index_projects_users_on_project_id"
    t.index ["user_id"], name: "index_projects_users_on_user_id"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.decimal "salary", precision: 10
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
