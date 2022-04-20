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

ActiveRecord::Schema.define(version: 2022_04_20_014133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.integer "post_id"
    t.integer "subscriber_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "sent_at"
    t.datetime "scheduled_for"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scheduled_for"], name: "index_posts_on_scheduled_for"
    t.index ["sent_at"], name: "index_posts_on_sent_at"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "wallet"
    t.string "transaction_hash"
    t.string "webhook_url"
    t.datetime "expires_at"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expires_at"], name: "index_subscribers_on_expires_at"
  end

end
