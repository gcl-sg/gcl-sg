# == Schema Information
#
# Table name: businesses
#
#  id                :integer          not null, primary key
#  title_en          :string
#  title_zh_cn       :string
#  title_zh_tw       :string
#  description_en    :string
#  description_zh_cn :string
#  description_zh_tw :string
#  cover             :string
#  sort              :integer
#  visible           :boolean          default(TRUE)
#  url               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_businesses_on_sort     (sort)
#  index_businesses_on_visible  (visible)
#

class Business < ApplicationRecord
  localeable :title, :description

  mount_uploader :cover, BusinessCoverUploader
  validates_presence_of :cover, :sort

  default_scope -> { order('businesses.sort asc') }
  scope :visible, -> { where(visible: true) }
end
