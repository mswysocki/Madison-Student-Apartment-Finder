class EditListingTable < ActiveRecord::Migration
  def self.up
    remove_column :lists, :Pets
    remove_column :lists, :Bedrooms
    remove_column :lists, :Type
    add_column    :lists, :Bedrooms,  :integer
    add_column    :lists, :Pets,      :boolean
    add_column    :lists, :Type,      :boolean
  end

  def self.down
    remove_column :lists, :Pets                                                                                                              
    remove_column :lists, :Bedrooms
    remove_column :lists, :Type
    add_column    :lists, :Pets,      :string
    add_column    :lists, :Bedrooms,  :string
    add_column    :lists, :Type,      :integer
  end
end
