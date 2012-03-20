class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :Address
      t.string :City
      t.string :State
      t.integer :Zip
      t.integer :Region
      t.string :Bedrooms
      t.float :Bathrooms
      t.integer :Rent
      t.integer :SquareFeet
      t.integer :Parking
      t.boolean :Smoking
      t.string :Pets
      t.boolean :Heat
      t.boolean :Electric
      t.integer :Flags

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
