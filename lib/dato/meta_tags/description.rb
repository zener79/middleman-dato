require 'dato/meta_tags/base'

module Dato
  module MetaTags
    class Description < Base
      def build
        if description.present?
          [
            builder.tag(
              :meta,
              name: 'description',
              content: description
            ),
            builder.tag(
              :meta,
              property: 'og:description',
              content: description
            ),
            builder.tag(
              :meta,
              name: 'twitter:description',
              content: description
            )
          ]
        end
      end

      def description
        @description ||= seo_field_with_fallback(:description)
      end
    end
  end
end
