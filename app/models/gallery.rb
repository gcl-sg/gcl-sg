# == Schema Information
#
# Table name: galleries
#
#  id              :integer          not null, primary key
#  site_id         :integer
#  visible         :boolean          default(TRUE)
#  sort            :integer
#  title_en        :string
#  title_zh_cn     :string
#  title_zh_tw     :string
#  desc_en         :string
#  desc_zh_cn      :string
#  desc_zh_tw      :string
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sub_title_en    :string
#  sub_title_zh_cn :string
#  sub_title_zh_tw :string
#  color           :string
#
# Indexes
#
#  index_galleries_on_site_id  (site_id)
#  index_galleries_on_sort     (sort)
#  index_galleries_on_visible  (visible)
#

class Gallery < ApplicationRecord
  second_level_cache version: 1.0, expires_in: 1.week
  belongs_to :site, touch: true
  localeable :title, :sub_title, :desc

  mount_uploader :image, GalleryImageUploader

  default_scope -> { order('galleries.sort asc') }
  scope :visible, -> { where(visible: true) }

  delegate :gallery_type, to: :site, allow_nil: true
  validates_presence_of :site, :sort, :image
  validates_presence_of :color, if: Proc.new{|record| Site::LEFT_RIGHT == record.gallery_type }
end
