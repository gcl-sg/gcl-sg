module TitleWithLocale
  extend ActiveSupport::Concern

  def title
    case I18n.locale
      when :'zh-CN'
        title_zh_cn
      when :'zh-TW'
        title_zh_tw
      when :en
        title_en
      else
        title_zh_cn
    end
  end
end