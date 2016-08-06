class CoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [530, 46]
  end

  version :detail do
    process :resize_to_fill => [2650, 232]
  end

end