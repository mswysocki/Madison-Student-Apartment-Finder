class AddRelationsToReview < ActiveRecord::Migration
  def self.up
	add_column :reviews, :list_id, :integer
	rename_column :reviews, :helpfullness, :helpfulness
  end

  def self.down
	remove_column :reviews, :list_id
	rename_column :reviews, :helpfulness, :helpfullness
  end
end
