class AddUserRelationToReview < ActiveRecord::Migration
  def self.up
	add_column :reviews, :user_id, :integer
	add_column :lists, :user_id, :integer
	add_index :reviews, :list_id
  end

  def self.down
	remove_column :reviews, :user_id
	remove_column :lists, :user_id, :integer
	remove_index :reviews, :list_id
  end
end
