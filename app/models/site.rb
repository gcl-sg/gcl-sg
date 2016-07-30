# == Schema Information
#
# Table name: sites
#
#  id          :integer          not null, primary key
#  category_id :integer
#  sort        :integer
#  visible     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title_en    :string
#  title_zh_CN :string
#  title_zh_TW :string
#  body_en     :text
#  body_zh_CN  :text
#  body_zh_TW  :text
#

class Site < ApplicationRecord
  belongs_to :category

  validates_presence_of :category, :sort, :title_en, :title_zh_CN, :title_zh_TW, :body_en, :body_zh_CN, :body_zh_TW

  def title
    case I18n.locale
      when :'zh-CN'
        title_zh_CN
      when :'zh-TW'
        title_zh_TW
      when :en
        title_en
      else
        title_zh_CN
    end
  end

  def body
    case I18n.locale
      when :'zh-CN'
        body_zh_CN
      when :'zh-TW'
        body_zh_TW
      when :en
        body_en
      else
        body_zh_CN
    end
  end
end
