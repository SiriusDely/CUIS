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

ActiveRecord::Schema.define(version: 20180218064520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "full_name", default: "", null: false
    t.string "short_name", default: "", null: false
    t.string "address", default: ""
    t.bigint "credit_union_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_union_id"], name: "index_branches_on_credit_union_id"
  end

  create_table "credit_unions", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "short_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: ""
    t.date "birth_date", null: false
    t.string "birth_place", default: "", null: false
    t.bigint "credit_union_id", null: false
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_members_on_branch_id"
    t.index ["credit_union_id"], name: "index_members_on_credit_union_id"
  end

  create_table "saving_accounts", force: :cascade do |t|
    t.string "number", default: "", null: false
    t.float "interest_rate", default: 0.0, null: false
    t.bigint "saving_product_id", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_saving_accounts_on_member_id"
    t.index ["saving_product_id"], name: "index_saving_accounts_on_saving_product_id"
  end

  create_table "saving_products", force: :cascade do |t|
    t.string "full_name", default: "", null: false
    t.string "short_name", default: "", null: false
    t.float "interest_rate", null: false
    t.bigint "credit_union_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_union_id"], name: "index_saving_products_on_credit_union_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "roles_mask", default: 0, null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["roles_mask"], name: "index_users_on_roles_mask"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "branches", "credit_unions"
  add_foreign_key "members", "branches"
  add_foreign_key "members", "credit_unions"
  add_foreign_key "saving_accounts", "members"
  add_foreign_key "saving_accounts", "saving_products"
  add_foreign_key "saving_products", "credit_unions"
end
