class ChangeUsersLowercase < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.rename :Name, :name
      t.rename :Email, :email
    end
  end

  def self.down
    change_table :users do |t|
      t.rename :name, :Name
      t.rename :email, :Email
    end
  end
end
