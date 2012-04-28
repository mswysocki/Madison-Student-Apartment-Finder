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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120428032229) do

  create_table "landlords", :force => true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "website"
    t.string  "phone"
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.integer "zip"
  end

  create_table "lists", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "region"
    t.float    "bathrooms"
    t.integer  "rent"
    t.integer  "squarefeet"
    t.boolean  "smoking"
    t.boolean  "heat"
    t.boolean  "electric"
    t.integer  "flags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gas"
    t.boolean  "garbagecollection"
    t.integer  "length"
    t.boolean  "furnished"
    t.boolean  "laundry"
    t.boolean  "parking"
    t.integer  "bedrooms"
    t.boolean  "pets"
    t.boolean  "ltype"
    t.integer  "user_id"
    t.integer  "aptnum"
    t.string   "building_name"
  end

  add_index "lists", ["address"], :name => "index_lists_on_Address"
  add_index "lists", ["bedrooms"], :name => "index_lists_on_Bedrooms"
  add_index "lists", ["rent"], :name => "index_lists_on_Rent"

  create_table "reviews", :force => true do |t|
    t.string   "review_body"
    t.float    "rating"
    t.integer  "helpfulness"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "list_id"
    t.integer  "user_id"
  end

  add_index "reviews", ["list_id"], :name => "index_reviews_on_list_id"
  add_index "reviews", ["rating"], :name => "index_reviews_on_rating"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",                  :default => false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["auth_token"], :name => "index_users_on_auth_token"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
