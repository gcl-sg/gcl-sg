class CoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fit => [530, 46]
  end

  version :detail do
    process :resize_to_fit => [2650, 232]
  end

end