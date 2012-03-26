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

ActiveRecord::Schema.define(:version => 20120326044311) do

  create_table "lists", :force => true do |t|
    t.string   "Address"
    t.string   "City"
    t.string   "State"
    t.integer  "Zip"
    t.integer  "Region"
    t.float    "Bathrooms"
    t.integer  "Rent"
    t.integer  "SquareFeet"
    t.boolean  "Smoking"
    t.boolean  "Heat"
    t.boolean  "Electric"
    t.integer  "Flags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "Gas"
    t.boolean  "GarbageCollection"
    t.integer  "Length"
    t.boolean  "Furnished"
    t.boolean  "Laundry"
    t.boolean  "Parking"
    t.integer  "Bedrooms"
    t.boolean  "Pets"
    t.boolean  "Type"
  end

  add_index "lists", ["Address"], :name => "index_lists_on_Address"
  add_index "lists", ["Bedrooms"], :name => "index_lists_on_Bedrooms"
  add_index "lists", ["Rent"], :name => "index_lists_on_Rent"

  create_table "users", :force => true do |t|
    t.string   "Name"
    t.string   "Email"
    t.boolean  "Admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["Email"], :name => "index_users_on_email", :unique => true

end
