require 'dato/meta_tags/og_meta_tag'

module Dato
  module MetaTags
    class OgLocale < OgMetaTag
      def buildable?
        true
      end

      def name
        'og:locale'
      end

      def value
        locale = I18n.locale
        "#{locale}_#{locale.upcase}"
      end
    end
  end
end
