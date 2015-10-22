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

ActiveRecord::Schema.define(version: 20151015145740) do

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

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description_880941"
    t.string   "description_609312"
    t.string   "description_45120"
    t.string   "description_646956"
    t.string   "description_359190"
    t.string   "description_414526"
    t.string   "description_126104"
    t.string   "description_21394"
    t.string   "description_200553"
    t.string   "description_47383"
    t.string   "description_817819"
    t.string   "description_297200"
    t.string   "description_732496"
    t.string   "description_578733"
    t.string   "description_181448"
    t.string   "description_591849"
    t.string   "description_29523"
    t.string   "description_859516"
    t.string   "description_607626"
    t.string   "description_634417"
    t.integer  "amount_96786"
    t.integer  "amount_118208"
    t.integer  "amount_354589"
    t.integer  "amount_529364"
    t.integer  "amount_2748"
    t.integer  "amount_265448"
    t.integer  "amount_87259"
    t.integer  "amount_69192"
    t.integer  "amount_400320"
    t.integer  "amount_981344"
    t.integer  "amount_724725"
    t.integer  "amount_233529"
    t.integer  "amount_10548"
    t.integer  "amount_918245"
    t.integer  "amount_400389"
    t.integer  "amount_630390"
    t.integer  "amount_183655"
    t.integer  "amount_83287"
    t.integer  "amount_252578"
    t.integer  "amount_147921"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

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

end
