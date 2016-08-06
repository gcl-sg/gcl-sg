# == Schema Information
#
# Table name: banners
#
#  id                :integer          not null, primary key
#  cover             :string
#  sort              :integer
#  visible           :boolean          default(TRUE)
#  title_en          :string
#  title_zh_cn       :string
#  title_zh_tw       :string
#  description_en    :string
#  description_zh_cn :string
#  description_zh_tw :string
#  url               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_banners_on_sort     (sort)
#  index_banners_on_visible  (visible)
#

class Banner < ApplicationRecord
  localeable :title, :description

  mount_uploader :cover, BannerCoverUploader
  validates_presence_of :cover, :sort

  default_scope -> { order('banners.sort asc') }
  scope :visible, -> { where(visible: true) }
end
