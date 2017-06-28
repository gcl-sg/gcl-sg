# == Schema Information
#
# Table name: company_profiles
#
#  id                :integer          not null, primary key
#  title_en          :string
#  title_zh_cn       :string
#  title_zh_tw       :string
#  description_en    :text
#  description_zh_cn :text
#  description_zh_tw :text
#  cover             :string
#  sort              :integer
#  visible           :boolean          default(TRUE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_company_profiles_on_sort     (sort)
#  index_company_profiles_on_visible  (visible)
#

class CompanyProfile < ApplicationRecord
  second_level_cache version: 1.0, expires_in: 1.week
  localeable :title, :description

  mount_uploader :cover, CompanyProfileCoverUploader
  validates_presence_of :cover, :sort, :title_en, :title_zh_cn, :title_zh_tw, :description_en, :description_zh_cn, :description_zh_tw

  default_scope -> { order('sort asc') }
  scope :visible, -> { where(visible: true) }
end
