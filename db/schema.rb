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

ActiveRecord::Schema.define(version: 20170528135608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "license"
    t.string "first_name"
    t.string "last_name"
    t.bigint "wash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wash_id"], name: "index_customers_on_wash_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.integer "threshold"
    t.string "equator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stolen_cars", force: :cascade do |t|
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wash_exceptions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "washes", force: :cascade do |t|
    t.string "amount"
    t.bigint "package_id"
    t.bigint "addon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.string "license"
    t.bigint "wash_exception_id"
    t.index ["addon_id"], name: "index_washes_on_addon_id"
    t.index ["customer_id"], name: "index_washes_on_customer_id"
    t.index ["package_id"], name: "index_washes_on_package_id"
    t.index ["wash_exception_id"], name: "index_washes_on_wash_exception_id"
  end

  add_foreign_key "washes", "customers"
  add_foreign_key "washes", "wash_exceptions"
end
