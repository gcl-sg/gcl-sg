class GalleryImageUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [300, 100]
  end

  version :detail do
    process :resize_to_fill => [1200, 400]
  end

end