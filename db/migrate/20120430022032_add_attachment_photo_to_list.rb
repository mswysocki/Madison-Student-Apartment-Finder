class AddAttachmentPhotoToList < ActiveRecord::Migration
  def self.up
    #add_column :lists, :photo_file_name, :string
    #add_column :lists, :photo_content_type, :string
    #add_column :lists, :photo_file_size, :integer
    #add_column :lists, :photo_updated_at, :datetime
    add_column :lists, :image, :string
  end

  def self.down
    #remove_column :lists, :photo_file_name
    #remove_column :lists, :photo_content_type
    #remove_column :lists, :photo_file_size
    #remove_column :lists, :photo_updated_at
    remove_column :lists, :image
  end
end
