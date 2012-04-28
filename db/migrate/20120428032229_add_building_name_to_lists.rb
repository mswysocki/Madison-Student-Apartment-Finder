class AddBuildingNameToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :building_name, :string
  end

  def self.down
    remove_column :lists, :building_name
  end
end