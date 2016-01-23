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

ActiveRecord::Schema.define(version: 20160123204711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.integer  "minutes",       null: false
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date_of_steps", null: false
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
    t.string   "co_ins_percent"
    t.integer  "out_of_pocket_max",  null: false
    t.date     "renewal_date",       null: false
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "effective_date",     null: false
  end

  add_index "med_coverages", ["user_id"], name: "index_med_coverages_on_user_id", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

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

  create_table "rx_alerts", force: :cascade do |t|
    t.time     "time_to_take",                    null: false
    t.integer  "user_id"
    t.integer  "prescription_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "M",               default: false
    t.boolean  "T",               default: false
    t.boolean  "W",               default: false
    t.boolean  "Th",              default: false
    t.boolean  "F",               default: false
    t.boolean  "S",               default: false
    t.boolean  "Su",              default: false
  end

  add_index "rx_alerts", ["prescription_id"], name: "index_rx_alerts_on_prescription_id", using: :btree
  add_index "rx_alerts", ["user_id"], name: "index_rx_alerts_on_user_id", using: :btree

  create_table "sleeps", force: :cascade do |t|
    t.integer  "hours",         null: false
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date_of_sleep", null: false
  end

  add_index "sleeps", ["user_id"], name: "index_sleeps_on_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "steps_today",   null: false
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date_of_steps", null: false
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
    t.string   "mobile_phone"
    t.string   "twitter"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

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
  add_foreign_key "rx_alerts", "prescriptions"
  add_foreign_key "rx_alerts", "users"
  add_foreign_key "sleeps", "users"
  add_foreign_key "steps", "users"
  add_foreign_key "visits", "users"
end
