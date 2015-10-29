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

ActiveRecord::Schema.define(version: 20151029165549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.integer  "minutes",    null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id", using: :btree

  create_table "med_coverages", force: :cascade do |t|
    t.string   "carrier",            null: false
    t.string   "plan_level",         null: false
    t.string   "network_type",       null: false
    t.string   "memberid",           null: false
    t.integer  "pcp_fee",            null: false
    t.integer  "specialist_fee",     null: false
    t.integer  "er_fee",             null: false
    t.integer  "rx_brand_fee"
    t.integer  "rx_generic_fee"
    t.integer  "in_net_deduct_ind"
    t.integer  "in_net_deduct_fam"
    t.integer  "out_net_deduct_ind"
    t.integer  "out_net_deduct_fam"
    t.integer  "co_ins_percent"
    t.integer  "out_of_pocket_max",  null: false
    t.date     "renewal_date",       null: false
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "med_coverages", ["user_id"], name: "index_med_coverages_on_user_id", using: :btree

  create_table "prescriptions", force: :cascade do |t|
    t.string   "name",                            null: false
    t.integer  "dosage",                          null: false
    t.string   "frequency",                       null: false
    t.boolean  "brand",           default: false
    t.date     "date_prescribed",                 null: false
    t.date     "refill_till"
    t.string   "rx_notes"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "prescriptions", ["user_id"], name: "index_prescriptions_on_user_id", using: :btree

  create_table "sleeps", force: :cascade do |t|
    t.integer  "minutes",    null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sleeps", ["user_id"], name: "index_sleeps_on_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "steps_today", null: false
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "steps", ["user_id"], name: "index_steps_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "middle_name"
    t.string   "last_name",                           null: false
    t.date     "dob",                                 null: false
    t.string   "ssn",                                 null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.string   "physician_first",  null: false
    t.string   "physician_last",   null: false
    t.date     "dos",              null: false
    t.string   "reason_for_visit", null: false
    t.string   "diagnosis",        null: false
    t.string   "dr_notes"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

  add_foreign_key "exercises", "users"
  add_foreign_key "med_coverages", "users"
  add_foreign_key "prescriptions", "users"
  add_foreign_key "sleeps", "users"
  add_foreign_key "steps", "users"
  add_foreign_key "visits", "users"
end
