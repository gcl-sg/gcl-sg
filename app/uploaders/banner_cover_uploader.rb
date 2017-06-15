class BannerCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [240, 100]
  end

  version :detail do
    process :resize_to_fill => [1920, 800]
  end

end
