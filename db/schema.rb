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

ActiveRecord::Schema.define(:version => 20120322040021) do

  create_table "lists", :force => true do |t|
    t.string   "Address"
    t.string   "City"
    t.string   "State"
    t.integer  "Zip"
    t.integer  "Region"
    t.string   "Bedrooms"
    t.float    "Bathrooms"
    t.integer  "Rent"
    t.integer  "SquareFeet"
    t.boolean  "Smoking"
    t.string   "Pets"
    t.boolean  "Heat"
    t.boolean  "Electric"
    t.integer  "Flags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "Gas"
    t.boolean  "GarbageCollection"
    t.integer  "Type"
    t.integer  "Length"
    t.boolean  "Furnished"
    t.boolean  "Laundry"
    t.boolean  "Parking"
  end

end
