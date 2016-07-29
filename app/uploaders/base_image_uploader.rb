# encoding: utf-8

class BaseImageUploader < BaseUploader
  IMAGE_FILE_TYPES = %w(jpg jpeg png gif tiff)


  def extension_white_list
    IMAGE_FILE_TYPES
  end


  def filename
    if super.present?
      "#{secure_token}.#{file.extension.downcase}"
    end
  end

  protected
  def secure_token(length = 16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end
end