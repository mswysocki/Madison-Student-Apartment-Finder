class AddIndexToAuthToken < ActiveRecord::Migration
  def self.up
    add_index :users,       :auth_token
    add_index :reviews,     :rating
    add_index :reviews,     :user_id
  end

  def self.down
    remove_index :users,    :auth_token
    remove_index :reviews,  :rating
    remove_index :reviews,  :user_id
  end
end
