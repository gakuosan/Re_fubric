ActiveRecord::Schema.define(version: 2019_07_13_065230) do

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "password_digest"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_buyers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true
  end

  create_table "fabrics", force: :cascade do |t|
    t.string "fabric_color"
    t.integer "fabric_weight"
    t.integer "fabric_yarn_count"
    t.string "fabric_knitting_way"
    t.integer "fabric_price"
    t.integer "fabric_composition"
    t.integer "fabric_id"
    t.integer "fabric_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "fbric_id"
    t.integer "fabric_maker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "password_digest"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "fabric_id"
    t.integer "fabric_meter_count"
    t.text "religion"
    t.integer "shipping_date"
    t.integer "fabric_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "top_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
