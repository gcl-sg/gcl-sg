module BodyWithLocale
  extend ActiveSupport::Concern

  def body
    case I18n.locale
      when :'zh-CN'
        body_zh_cn
      when :'zh-TW'
        body_zh_tw
      when :en
        body_en
      else
        body_zh_cn
    end
  end
end