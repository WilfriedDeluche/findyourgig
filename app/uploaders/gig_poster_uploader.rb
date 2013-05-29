# encoding: utf-8

class GigPosterUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  
  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :normal do
    process :resize_to_fit => [800,1200]
  end

  version :page, :from_version => :normal do
    process :resize_to_fit => [300,450]
  end

  version :thumb, :from_version => :page do
    process :resize_to_fill => [180, 250]
  end

  # White list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  def filename
    "poster.jpg" if original_filename
  end

end
