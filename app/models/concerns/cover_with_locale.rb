module CoverWithLocale
  extend ActiveSupport::Concern

  def cover
    case I18n.locale
      when :'zh-CN'
        cover_zh_cn
      when :'zh-TW'
        cover_zh_tw
      when :en
        cover_en
      else
        cover_zh_cn
    end
  end
end