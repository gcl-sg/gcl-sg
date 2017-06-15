class NewsCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [300, 205]
  end

  version :detail do
    process :resize_to_fill => [660, 438]
  end

end
