class AddToListingTable < ActiveRecord::Migration
  def self.up
    add_column :lists, :Gas, :boolean
    add_column :lists, :GarbageCollection, :boolean
    add_column :lists, :Type, :integer
    add_column :lists, :Length, :integer
    add_column :lists, :Furnished, :boolean
    add_column :lists, :Laundry, :boolean
    remove_column :lists, :Parking
    add_column :lists, :Parking, :boolean
  end

  def self.down
    remove_column :lists, :Parking                                                                                                               
    remove_column :lists, :Gas
    remove_column :lists, :GarbageCollection
    remove_column :lists, :Type
    remove_column :lists, :Length
    remove_column :lists, :Furnished
    remove_column :lists, :Laundry
    add_column :lists, :Parking, :integer
  end
end
