# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_29_191722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchanges", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.string "region"
    t.string "mic"
    t.string "exchange_suffix"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "indices", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.decimal "latest_price"
    t.bigint "exchange_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exchange_id"], name: "index_indices_on_exchange_id"
  end

  create_table "indices_stocks", id: false, force: :cascade do |t|
    t.bigint "index_id"
    t.bigint "stock_id"
    t.index ["index_id"], name: "index_indices_stocks_on_index_id"
    t.index ["stock_id"], name: "index_indices_stocks_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.decimal "latest_price"
    t.bigint "exchange_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exchange_id"], name: "index_stocks_on_exchange_id"
  end

end
