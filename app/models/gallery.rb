# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  visible     :boolean          default(TRUE)
#  sort        :integer
#  title_en    :string
#  title_zh_cn :string
#  title_zh_tw :string
#  desc_en     :string
#  desc_zh_cn  :string
#  desc_zh_tw  :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_galleries_on_site_id  (site_id)
#  index_galleries_on_sort     (sort)
#  index_galleries_on_visible  (visible)
#

class Gallery < ApplicationRecord
  belongs_to :site, touch: true
  localeable :title, :desc

  mount_uploader :image, GalleryImageUploader

  default_scope -> { order('galleries.sort asc') }
  scope :visible, -> { where(visible: true) }

  validates_presence_of :site, :sort, :title_en, :title_zh_cn, :title_zh_tw, :desc_en, :desc_zh_cn, :desc_zh_tw, :image

end
