# == Schema Information
#
# Table name: news
#
#  id           :integer          not null, primary key
#  category     :integer
#  title_en     :string
#  title_zh_cn  :string
#  title_zh_tw  :string
#  published_at :datetime
#  body_en      :text
#  body_zh_cn   :text
#  body_zh_tw   :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  enable_en    :boolean          default(FALSE)
#  enable_zh_cn :boolean          default(FALSE)
#  enable_zh_tw :boolean          default(FALSE)
#  visible      :boolean          default(TRUE)
#  cover        :string
#
# Indexes
#
#  index_news_on_category      (category)
#  index_news_on_enable_en     (enable_en)
#  index_news_on_enable_zh_cn  (enable_zh_cn)
#  index_news_on_enable_zh_tw  (enable_zh_tw)
#

class News < ApplicationRecord
  include Search::NewsIndex
  second_level_cache version: 1.0, expires_in: 1.week
  localeable :title, :body

  enum category: { company: 0, industry: 1, media: 2 }
  mount_uploader :cover, NewsCoverUploader

  validates_presence_of :category, :cover

  before_save :adjust_enable_locale
  before_save :set_published_at_if_not_exist

  default_scope -> { order('published_at desc') }
  scope :visible, -> { where(visible: true) }
  scope :with_locale, ->(locale = nil) { where("enable_#{(locale || I18n.locale).to_s.underscore} = ?", true) }

  def self.categories_id_i18n
    categories.map{|key,value|[News.categories_i18n[key], value]}
  end

  private
  def adjust_enable_locale
    self.enable_en = (title_en.present? && body_en.present?) ? true : false
    self.enable_zh_cn = (title_zh_cn.present? && body_zh_cn.present?) ? true : false
    self.enable_zh_tw = (title_zh_tw.present? && body_zh_tw.present?) ? true : false
  end

  def set_published_at_if_not_exist
    self.published_at ||= DateTime.current
  end

end
