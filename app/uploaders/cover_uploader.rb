class CoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [480, 95]
  end

  version :detail do
    process :resize_to_fill => [1920, 377]
  end

end
