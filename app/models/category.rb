# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  sort       :integer
#  visible    :boolean          default(TRUE)
#  code       :string
#  name_en    :string
#  name_zh_cn :string
#  name_zh_tw :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cover      :string
#  slug       :string
#
# Indexes
#
#  index_categories_on_slug     (slug) UNIQUE
#  index_categories_on_visible  (visible)
#

class Category < ApplicationRecord
  has_many :sites

  default_scope -> { order('sort asc') }
  scope :visible, -> { where(visible: true) }

  mount_uploader :cover, CoverUploader

  validates_presence_of :sort, :code, :name_en, :name_zh_cn, :name_zh_tw

  extend FriendlyId
  friendly_id :code, use: [:slugged, :finders]

  def name
    case I18n.locale
      when :'zh-CN'
        name_zh_cn
      when :'zh-TW'
        name_zh_tw
      when :en
        name_en
      else
        name_zh_cn
    end
  end

  def include_news_module?
    self.code == 'news'
  end

  def self.news_category
    self.where(code: 'news').first
  end

end
