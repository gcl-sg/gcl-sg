# == Schema Information
#
# Table name: news
#
#  id           :integer          not null, primary key
#  category     :string
#  title_en     :string
#  title_zh_CN  :string
#  title_zh_TW  :string
#  published_at :datetime
#  body_en      :text
#  body_zh_CN   :text
#  body_zh_TW   :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  en_enable    :boolean          default(FALSE)
#  zh_CN_enable :boolean          default(FALSE)
#  zh_TW_enable :boolean          default(FALSE)
#  visible      :boolean          default(TRUE)
#

class News < ApplicationRecord
  extend Enumerize

  enumerize :category, in: [:company, :industry, :media], default: :company, scope: true

  validates_presence_of :category

  before_save :adjust_enable_locale
  before_save :set_published_at_if_not_exist

  private
  def adjust_enable_locale
    self.en_enable = (title_en.present? && body_en.present?) ? true : false
    self.zh_CN_enable = (title_zh_CN.present? && body_zh_CN.present?) ? true : false
    self.zh_TW_enable = (title_zh_TW.present? && body_zh_TW.present?) ? true : false
  end

  def set_published_at_if_not_exist
    published_at ||= DateTime.current
  end
end
