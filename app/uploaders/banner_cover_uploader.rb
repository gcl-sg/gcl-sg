class BannerCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [512, 110]
  end

  version :detail do
    process :resize_to_fill => [2560, 550]
  end

end