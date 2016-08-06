class AlbumCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [203, 269]
  end

  version :detail do
    process :resize_to_fill => [203, 269]
  end

end