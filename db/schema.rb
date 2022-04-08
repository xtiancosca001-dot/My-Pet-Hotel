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

ActiveRecord::Schema[7.0].define(version: 2022_04_08_005422) do
  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "tel_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "pet_bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "cage_num"
    t.integer "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pet_bookings_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "pet_type"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["owner_id"], name: "index_pets_on_owner_id"
  end

  add_foreign_key "pet_bookings", "pets"
  add_foreign_key "pets", "owners"
end
