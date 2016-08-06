# == Schema Information
#
# Table name: albums
#
#  id           :integer          not null, primary key
#  visible      :boolean          default(TRUE)
#  published_at :datetime
#  title_en     :string
#  title_zh_cn  :string
#  title_zh_tw  :string
#  cover_en     :string
#  cover_zh_cn  :string
#  cover_zh_tw  :string
#  file_en      :string
#  file_zh_cn   :string
#  file_zh_tw   :string
#  enable_en    :boolean          default(FALSE)
#  enable_zh_cn :boolean          default(FALSE)
#  enable_zh_tw :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_albums_on_enable_en     (enable_en)
#  index_albums_on_enable_zh_cn  (enable_zh_cn)
#  index_albums_on_enable_zh_tw  (enable_zh_tw)
#  index_albums_on_visible       (visible)
#

class Album < ApplicationRecord
  localeable :title, :cover, :file
  mount_uploader :cover_en, AlbumCoverUploader
  mount_uploader :cover_zh_cn, AlbumCoverUploader
  mount_uploader :cover_zh_tw, AlbumCoverUploader
  mount_uploader :file_en, AlbumFileUploader
  mount_uploader :file_zh_cn, AlbumFileUploader
  mount_uploader :file_zh_tw, AlbumFileUploader

  before_save :adjust_enable_locale
  before_save :set_published_at_if_not_exist

  default_scope -> { order('published_at desc') }
  scope :visible, -> { where(visible: true) }
  scope :with_locale, ->(locale = nil) { where("enable_#{(locale || I18n.locale).to_s.underscore} = ?", true) }

  private
  def adjust_enable_locale
    self.enable_en = (title_en.present? && cover_en.present? && file_en.present?) ? true : false
    self.enable_zh_cn = (title_zh_cn.present? && cover_zh_cn.present? && file_zh_cn.present?) ? true : false
    self.enable_zh_tw = (title_zh_tw.present? && cover_zh_tw.present? && file_zh_tw.present?) ? true : false
  end

  def set_published_at_if_not_exist
    self.published_at ||= DateTime.current
  end
end
