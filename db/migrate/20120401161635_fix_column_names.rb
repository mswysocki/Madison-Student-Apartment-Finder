class FixColumnNames < ActiveRecord::Migration
  def self.up
    change_table :lists do |t|
      t.rename :Address, :address
      t.rename :City, :city 
      t.rename :State, :state
      t.rename :Zip, :zip 
      t.rename :Region, :region 
      t.rename :Bathrooms, :bathrooms 
      t.rename :Rent, :rent 
      t.rename :SquareFeet, :squarefeet 
      t.rename :Smoking, :smoking
      t.rename :Heat, :heat 
      t.rename :Electric, :electric
      t.rename :Flags, :flags 
      t.rename :Gas, :gas 
      t.rename :GarbageCollection, :garbagecollection
      t.rename :Length, :length
      t.rename :Furnished, :furnished 
      t.rename :Laundry, :laundry
      t.rename :Parking, :parking
      t.rename :Bedrooms, :bedrooms 
      t.rename :Pets, :pets
      t.rename :Type, :ltype 
    end
  end

  def self.down
    change_table :lists do |t|
      t.rename :address, :Address
      t.rename :city, :City
      t.rename :state, :State
      t.rename :zip, :Zip
      t.rename :region, :Region
      t.rename :bathrooms, :Bathrooms
      t.rename :rent, :Rent
      t.rename :squarefeet, :SquareFeet
      t.rename :smoking, :Smoking
      t.rename :heat, :Heat
      t.rename :electric, :Electric
      t.rename :flags, :Flags
      t.rename :gas, :Gas
      t.rename :garbagecollection, :GarbageCollection
      t.rename :length, :Length
      t.rename :furnished, :Furnished
      t.rename :laundry, :Laundry
      t.rename :parking, :Parking
      t.rename :bedrooms, :Bedrooms
      t.rename :pets, :Pets
      t.rename :ltype, :Type
    end
  end
end
