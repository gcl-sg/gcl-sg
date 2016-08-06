class CompanyProfileCoverUploader < BaseImageUploader

  version :thumbnail do
    process :resize_to_fill => [318, 200]
  end

  version :detail do
    process :resize_to_fill => [318, 200]
  end

end