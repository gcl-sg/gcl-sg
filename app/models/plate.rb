# == Schema Information
#
# Table name: plates
#
#  id              :integer          not null, primary key
#  visible         :boolean          default(TRUE)
#  sort            :integer
#  title_en        :string
#  title_zh_cn     :string
#  title_zh_tw     :string
#  sub_title_en    :string
#  sub_title_zh_cn :string
#  sub_title_zh_tw :string
#  desc_en         :string
#  desc_zh_cn      :string
#  desc_zh_tw      :string
#  image           :string
#  url             :string
#  color           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_plates_on_sort     (sort)
#  index_plates_on_visible  (visible)
#

class Plate < ApplicationRecord
  second_level_cache version: 1.0, expires_in: 1.week

  localeable :title, :sub_title, :desc

  mount_uploader :image, PlateImageUploader

  default_scope -> { order('plates.sort asc') }
  scope :visible, -> { where(visible: true) }

  validates_presence_of :sort, :title_en, :title_zh_cn, :title_zh_tw, :image, :url, :color
end
