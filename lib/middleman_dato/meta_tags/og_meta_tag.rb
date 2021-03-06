# frozen_string_literal: true
require 'middleman_dato/meta_tags/base'

module MiddlemanDato
  module MetaTags
    class OgMetaTag < Base
      def buildable?
        false
      end

      def build
        builder.tag(:meta, property: name, content: value) if buildable?
      end

      def name
        raise NotImplementedError
      end

      def value
        raise NotImplementedError
      end
    end
  end
end
