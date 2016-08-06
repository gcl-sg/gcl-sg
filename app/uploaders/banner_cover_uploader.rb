class BannerCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fit => [512, 110]
  end

  version :detail do
    process :resize_to_fit => [2560, 550]
  end

end