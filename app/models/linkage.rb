# == Schema Information
#
# Table name: linkages
#
#  id          :integer          not null, primary key
#  sort        :integer
#  visible     :boolean          default(TRUE)
#  title_en    :string
#  title_zh_cn :string
#  title_zh_tw :string
#  url_en      :string
#  url_zh_cn   :string
#  url_zh_tw   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_linkages_on_sort     (sort)
#  index_linkages_on_visible  (visible)
#

class Linkage < ApplicationRecord
  second_level_cache version: 1.0, expires_in: 1.week
  localeable :title, :url

  default_scope -> { order('linkages.sort asc') }
  scope :visible, -> { where(visible: true) }

  validates_presence_of :sort, :visible, :title_en, :title_zh_cn, :title_zh_tw, :url_en, :url_zh_cn, :url_zh_tw
end
