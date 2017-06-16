class GalleryImageUploader < BaseImageUploader

  version :detail_standard do
    process :resize_to_fill => [1300, 500]
  end

  version :thumbnail_standard do
    process :resize_to_fill => [180, 116]
  end

  version :detail_left_right do
    process :resize_to_fill => [433, 355]
  end

  version :thumbnail_left_right do
    process :resize_to_fill => [216, 177]
  end

  version :detail_up_down do
    process :resize_to_fill => [433, 355]
  end

  version :thumbnail_up_down do
    process :resize_to_fill => [216, 177]
  end

  # this is the way to invoke the correct version of the gallery
  def detail
    self.send("detail_#{model.gallery_type || Site::STANDARD}")
  end

  def thumbnail
    self.send("thumbnail_#{model.gallery_type || Site::STANDARD}")
  end

end
