# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  sort       :integer
#  visible    :boolean
#  code       :string
#  name_en    :string
#  name_zh_CN :string
#  name_zh_TW :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cover      :string
#

class Category < ApplicationRecord
  has_many :sites

  default_scope -> { order('sort asc') }
  scope :visible, -> { where(visible: true) }

  mount_uploader :cover, CoverUploader

  validates_presence_of :sort, :code, :name_en, :name_zh_CN, :name_zh_TW

  def name
    case I18n.locale
      when :'zh-CN'
        name_zh_CN
      when :'zh-TW'
        name_zh_TW
      when :en
        name_en
      else
        name_zh_CN
    end
  end

end
