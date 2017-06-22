module Search
  module NewsIndex
    extend ActiveSupport::Concern

    HIGH_LIGHT_FIELDS = %i(title_en title_zh_cn title_zh_tw body_en body_zh_cn body_zh_tw)

    included do
      searchkick highlight: HIGH_LIGHT_FIELDS

      def search_data
        {
          title_en: title_en,
          title_zh_cn: title_zh_cn,
          title_zh_tw: title_zh_tw,
          body_en: sanitize(body_en),
          body_zh_cn: sanitize(body_zh_cn),
          body_zh_tw: sanitize(body_zh_tw),
          category: category,
          visible: visible,
          enable_en: enable_en,
          enable_zh_cn: enable_zh_cn,
          enable_zh_tw: enable_zh_tw
        }
      end

      private
      def sanitize html
        Rails::Html::FullSanitizer.new.sanitize(html)
      end
    end


    module ClassMethods

      def fulltext_search query = "*", page = nil, locale = I18n.locale
        query ||= "*"
        search "#{query}",
          where: {
          "enable_#{locale.to_s.underscore}" => true
        },
        fields: fulltext_search_fields(locale),
        order: {_score: :desc},
        page: page,
        per_page: 15,
        operator: "or",
        highlight: true
      end

      def fulltext_search_fields locale = I18n.locale
        ["title_#{locale.to_s.underscore}^10", "body_#{locale.to_s.underscore}"]
      end

    end
  end
end
