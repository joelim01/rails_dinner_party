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

ActiveRecord::Schema.define(version: 20160902120433) do

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.integer "user_id"
    t.text    "content"
    t.string  "commentable_type"
  end

  create_table "dinner_dishes", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "dinner_id"
    t.string  "course"
  end

  create_table "dinners", force: :cascade do |t|
    t.datetime "date"
    t.string   "chefs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dish_ingredients", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "ingredient_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "creators"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "imageable_id"
    t.string  "url"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dinner_id"
    t.integer "party_of"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
