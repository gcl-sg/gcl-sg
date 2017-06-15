class BusinessCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [160, 162]
  end

  version :detail do
    process :resize_to_fill => [640, 648]
  end

end
