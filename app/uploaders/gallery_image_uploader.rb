class GalleryImageUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [180, 116]
  end

  version :detail do
    process :resize_to_fill => [1300, 500]
  end

end
