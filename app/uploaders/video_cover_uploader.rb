class VideoCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fit => [215, 150]
  end

  version :detail do
    process :resize_to_fit => [215, 150]
  end

end