class PlateImageUploader < BaseImageUploader

  version :detail do
    process :resize_to_fill => [433, 355]
  end

  version :thumbnail do
    process :resize_to_fill => [216, 177]
  end

end
