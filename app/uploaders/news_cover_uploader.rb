class NewsCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [218, 153]
  end

  version :detail do
    process :resize_to_fill => [218, 153]
  end

end