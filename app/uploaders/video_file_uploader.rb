class VideoFileUploader < BaseUploader

  def move_to_cache
    true
  end

  def move_to_store
    true
  end
  
end