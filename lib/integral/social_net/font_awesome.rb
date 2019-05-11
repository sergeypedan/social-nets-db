# frozen_string_literal: true

require_relative "../tag_helper"

 module Integral
  class SocialNet
    module FontAwesome

      include TagHelper

      def fa_icon(**options)
        color = options.has_key?(:color) ? !!options.delete(:color) : true

        default_attributes = {
          class: ["fa", "fa-#{fa_id}"],
          style: ("color: #{record[:color]}" if color)
        }
        default_attributes = default_attributes.merge(options) if options.is_a?(Hash)
        attributes_str = tag_attributes_to_s(default_attributes)

        return "<span #{attributes_str}></span>"
      end

    end
  end
end
