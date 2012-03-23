class AddAddressIndex < ActiveRecord::Migration
  def self.up
    add_index :lists, :Address
    add_index :lists, :Bedrooms
    add_index :lists, :Rent
  end

  def self.down
    remove_index :lists, :Address
    remove_index :lists, :Bedrooms
    remove_index :lists, :Rent
  end
end
