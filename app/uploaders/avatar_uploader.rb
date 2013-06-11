# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
include CarrierWave::RMagick
  
  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/users/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :normal do
    process :resize_to_fill => [150,150]
  end

  version :thumb, :from_version => :normal do
    process :resize_to_fit => [60, 60]
  end

  version :mini, :from_version => :thumb do
    process :resize_to_fit => [25, 25]
  end

  # White list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  def filename
    "avatar.jpg" if original_filename
  end

end
