# == Schema Information
#
# Table name: sites
#
#  id          :integer          not null, primary key
#  category_id :integer
#  sort        :integer
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title_en    :string
#  title_zh_cn :string
#  title_zh_tw :string
#  body_en     :text
#  body_zh_cn  :text
#  body_zh_tw  :text
#
# Indexes
#
#  index_sites_on_visible  (visible)
#

class Site < ApplicationRecord
  belongs_to :category
  include TitleWithLocale
  include BodyWithLocale

  validates_presence_of :category, :sort, :title_en, :title_zh_cn, :title_zh_tw, :body_en, :body_zh_cn, :body_zh_tw
end
