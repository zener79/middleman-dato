# frozen_string_literal: true
require 'middleman_dato/meta_tags/twitter_meta_tag'

module MiddlemanDato
  module MetaTags
    class TwitterSite < TwitterMetaTag
      def buildable?
        global_seo_field(:twitter_account).present?
      end

      def name
        'twitter:site'
      end

      def value
        global_seo_field(:twitter_account)
      end
    end
  end
end
