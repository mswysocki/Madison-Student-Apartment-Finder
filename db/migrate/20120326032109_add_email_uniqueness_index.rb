class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :Email, :unique => true
  end

  def self.down
    remove_index :users, :Email
  end
end