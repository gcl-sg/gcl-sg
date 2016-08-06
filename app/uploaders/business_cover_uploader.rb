class BusinessCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [320, 121]
  end

  version :detail do
    process :resize_to_fill => [320, 121]
  end

end