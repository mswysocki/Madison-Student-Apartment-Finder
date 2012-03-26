class AddAdminToUsers < ActiveRecord::Migration
  #The upper case database attributes are a pain so I'm stopping them now
  def self.up
    remove_column :users, :Admin
    add_column :users, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :admin
    add_column :users, :Admin, :boolean
  end
end
