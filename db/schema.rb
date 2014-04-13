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

ActiveRecord::Schema.define(version: 20140413173411) do

  create_table "cards", force: true do |t|
    t.integer  "cardset_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "cards", ["cardset_id", "number"], name: "index_cards_on_cardset_id_and_number", unique: true

  create_table "cardset_masters", force: true do |t|
    t.integer  "user_id"
    t.integer  "cardset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cardset_masters", ["cardset_id", "user_id"], name: "index_cardset_masters_on_cardset_id_and_user_id", unique: true

  create_table "cardsets", force: true do |t|
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "master_card_file_name"
    t.string   "master_card_content_type"
    t.integer  "master_card_file_size"
    t.datetime "master_card_updated_at"
  end

  add_index "cardsets", ["identifier"], name: "index_cardsets_on_identifier", unique: true

  create_table "user_cards", force: true do |t|
    t.integer  "card_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_cards", ["card_id"], name: "index_user_cards_on_card_id"
  add_index "user_cards", ["user_id"], name: "index_user_cards_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
