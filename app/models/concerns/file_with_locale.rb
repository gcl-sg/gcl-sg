module FileWithLocale
  extend ActiveSupport::Concern

  def file
    case I18n.locale
      when :'zh-CN'
        file_zh_cn
      when :'zh-TW'
        file_zh_tw
      when :en
        file_en
      else
        file_zh_cn
    end
  end
end