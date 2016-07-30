class VideoCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fit => [215, 151]
  end

  version :detail do
    process :resize_to_fit => [215, 151]
  end

end