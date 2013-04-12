# encoding: utf-8

class VenueImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader (file or fog):
  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/venues/#{model.venue.id}/venue_images/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :normal do
    process :resize_to_fit => [800,400]
  end

  version :thumb, :from_version => :normal do
    process resize_to_fill: [150, 150]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
