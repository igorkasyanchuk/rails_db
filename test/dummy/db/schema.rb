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
    t.string   "description_974308"
    t.string   "description_795104"
    t.string   "description_616548"
    t.string   "description_436456"
    t.string   "description_336801"
    t.string   "description_437195"
    t.string   "description_604837"
    t.string   "description_646210"
    t.string   "description_278002"
    t.string   "description_781338"
    t.string   "description_58713"
    t.string   "description_353188"
    t.string   "description_535324"
    t.string   "description_25078"
    t.string   "description_836368"
    t.string   "description_237820"
    t.string   "description_874800"
    t.string   "description_528672"
    t.string   "description_679858"
    t.string   "description_750234"
    t.integer  "amount_342911"
    t.integer  "amount_120370"
    t.integer  "amount_903986"
    t.integer  "amount_444224"
    t.integer  "amount_343013"
    t.integer  "amount_646842"
    t.integer  "amount_109426"
    t.integer  "amount_130630"
    t.integer  "amount_636529"
    t.integer  "amount_566607"
    t.integer  "amount_599173"
    t.integer  "amount_314823"
    t.integer  "amount_621375"
    t.integer  "amount_1713"
    t.integer  "amount_658992"
    t.integer  "amount_19385"
    t.integer  "amount_663374"
    t.integer  "amount_666751"
    t.integer  "amount_863583"
    t.integer  "amount_341683"
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
