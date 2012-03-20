class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.integer :StreetNum
      t.string :StreetName
      t.string :City
      t.string :State
      t.integer :Zip
      t.integer :Region
      t.string :Bedrooms
      t.float :Bathrooms
      t.integer :Rent
      t.integer :SquareFeet
      t.integer :Parking
      t.binary :Smoking
      t.string :Pets
      t.binary :Heat
      t.binary :Electric
      t.integer :Flags

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
