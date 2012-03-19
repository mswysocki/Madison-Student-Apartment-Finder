class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.Int :StreetNum
      t.String :StreetName
      t.String :City
      t.String :State
      t.Int :Zip
      t.Int :Region
      t.Char :Bedrooms
      t.Float :Bathrooms
      t.Int :Rent
      t.Int :SquareFeet
      t.Int :Parking
      t.binary :Smoking
      t.Char :Pets
      t.binary :Heat
      t.binary :Electric
      t.Int :Flags

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
