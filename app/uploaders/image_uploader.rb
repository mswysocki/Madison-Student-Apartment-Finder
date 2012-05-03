# encoding: utf-8
require 'carrierwave/processing/mime_types'


class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::MimeTypes

  process :set_content_type

  # Choose what kind of storage to use for this uploader:
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  #white list - only images are allowed
  def extension_white_list
    %w(jpg jpeg gif png) #gif ...
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
      #def default_url
      #  "no_image_placeholder.jpg"
      #end
  #Above is too large, ... may look into later.

  #uploaded images will be scaled to be no larger than this
  process :resize_to_limit => [1000, 1000]  

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  def scale(width, height)
    # do something
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_limit => [100, 100]
  end
  
  version :show_page do
    process :resize_to_limit => [250, 250]
  end
  
  #here we create a version from another version (saves time, processing)
  version :small_thumb, :from_version => :thumb do
    process :resize_to_limit => [20, 20]
  end
  
  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
