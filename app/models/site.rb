# == Schema Information
#
# Table name: sites
#
#  id           :integer          not null, primary key
#  category_id  :integer
#  sort         :integer
#  visible      :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  title_en     :string
#  title_zh_cn  :string
#  title_zh_tw  :string
#  body_en      :text
#  body_zh_cn   :text
#  body_zh_tw   :text
#  url          :string
#  slug         :string
#  gallery_type :integer
#
# Indexes
#
#  index_sites_on_gallery_type  (gallery_type)
#  index_sites_on_slug          (slug) UNIQUE
#  index_sites_on_url           (url)
#  index_sites_on_visible       (visible)
#

class Site < ApplicationRecord
  belongs_to :category, touch: true
  has_many :galleries, dependent: :destroy, inverse_of: :site
  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true
  localeable :title, :body

  STANDARD = 'standard'
  LEFT_RIGHT = 'left_right'
  UP_DOWN = 'up_down'

  enum gallery_type: { STANDARD => 0, LEFT_RIGHT => 1, UP_DOWN => 2 }

  extend FriendlyId
  friendly_id :url, use: [:slugged, :finders]

  default_scope -> { order('sites.sort asc') }
  scope :visible, -> { where(visible: true) }

  validates_presence_of :category, :sort, :url, :title_en, :title_zh_cn, :title_zh_tw, :body_en, :body_zh_cn, :body_zh_tw
  validates_presence_of :gallery_type, if: Proc.new { |record| record.galleries.present? }

  def should_generate_new_friendly_id?
    slug.blank? || url_changed?
  end

  def self.gallery_types_id_i18n
    gallery_types.map{|key,value|[self.gallery_types_i18n[key], value]}
  end
end
