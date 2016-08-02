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
#  url         :string
#  slug        :string
#
# Indexes
#
#  index_sites_on_slug     (slug) UNIQUE
#  index_sites_on_url      (url)
#  index_sites_on_visible  (visible)
#

class Site < ApplicationRecord
  belongs_to :category, touch: true
  include TitleWithLocale
  include BodyWithLocale

  extend FriendlyId
  friendly_id :url, use: [:slugged, :finders]

  default_scope -> { order('sites.sort asc') }
  scope :visible, -> { where(visible: true) }

  validates_presence_of :category, :sort, :url, :title_en, :title_zh_cn, :title_zh_tw, :body_en, :body_zh_cn, :body_zh_tw

  def should_generate_new_friendly_id?
    slug.blank? || url_changed?
  end
end
