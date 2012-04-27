class AddAptnumToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :aptnum, :integer
  end

  def self.down
    remove_column :lists, :aptnum
  end
end
