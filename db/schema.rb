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

ActiveRecord::Schema.define(version: 2022_06_04_135154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.string "status"
    t.bigint "musician_id", null: false
    t.bigint "orchestra_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["musician_id"], name: "index_invitations_on_musician_id"
    t.index ["orchestra_id"], name: "index_invitations_on_orchestra_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "level"
    t.string "instrument"
    t.string "style"
    t.string "photo"
    t.string "bio"
    t.integer "zip_code"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_musicians_on_user_id"
  end

  create_table "orchestras", force: :cascade do |t|
    t.string "style"
    t.string "type_orchestra"
    t.integer "size"
    t.integer "zip_code"
    t.string "frequency"
    t.text "description"
    t.string "name"
    t.string "bio"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orchestras_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "instrument"
    t.text "description"
    t.string "level"
    t.string "periodicity"
    t.date "date"
    t.string "type"
    t.string "style"
    t.bigint "orchestra_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orchestra_id"], name: "index_posts_on_orchestra_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invitations", "musicians"
  add_foreign_key "invitations", "orchestras"
  add_foreign_key "orchestras", "users"
  add_foreign_key "posts", "orchestras"
end