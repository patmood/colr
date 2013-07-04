class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  
  def store_dir
    "images/uploads"
  end

  version :thumb do
    process :resize_to_limit => [100, 100]
  end
end
