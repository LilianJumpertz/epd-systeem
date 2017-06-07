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

ActiveRecord::Schema.define(version: 20170607152106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medicines", force: :cascade do |t|
    t.string   "generic_name"
    t.string   "brand_name"
    t.string   "active_ingredient"
    t.decimal  "dose"
    t.string   "dose_unit"
    t.string   "symptoms"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "patient_id"
    t.index ["patient_id"], name: "index_medicines_on_patient_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "BSN"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "postal_code"
    t.string   "place_of_residence"
    t.string   "phone_number"
    t.string   "email"
    t.string   "insurance_company"
    t.string   "policy_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
