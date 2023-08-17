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

ActiveRecord::Schema[7.0].define(version: 2023_08_17_222305) do
  create_table "character_profs", force: :cascade do |t|
    t.boolean "str_save"
    t.boolean "dex_save"
    t.boolean "con_save"
    t.boolean "int_save"
    t.boolean "wis_save"
    t.string "cha_save_boolean"
    t.boolean "athletics"
    t.boolean "acrobatics"
    t.boolean "sleight_of_hand"
    t.boolean "stealth"
    t.boolean "arcana"
    t.boolean "history"
    t.boolean "investigation"
    t.boolean "nature"
    t.boolean "religion"
    t.boolean "animal_handling"
    t.boolean "insight"
    t.boolean "medicine"
    t.boolean "perception"
    t.boolean "survival"
    t.boolean "deception"
    t.boolean "intimidation"
    t.boolean "persuasion"
    t.boolean "performance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "race"
    t.string "sub_race"
    t.string "background"
    t.integer "str_score"
    t.integer "dex_score"
    t.integer "con_score"
    t.integer "int_score"
    t.integer "wis_score"
    t.integer "cha_score"
    t.integer "total_hp"
    t.integer "current_hp"
    t.integer "gold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "clas"
    t.integer "users_id"
  end

  create_table "installs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
