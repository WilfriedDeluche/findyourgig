# encoding: utf-8

class BandImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader (file or fog):
  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/bands/#{model.band.id}/images/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :normal do
    process :resize_to_fit => [800,400]
  end

  version :header do
    process resize_to_fill: [830, 450]
  end

  version :thumb, :from_version => :normal do
    process resize_to_fill: [180, 180]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
