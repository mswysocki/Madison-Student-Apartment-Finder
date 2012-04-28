class AddLandlordToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :landlord_id, :integer
    add_index :lists, :landlord_id
  end

  def self.down
    remove_index :lists, :landlord_id
    remove_column :lists, :landlord_id
  end
end
