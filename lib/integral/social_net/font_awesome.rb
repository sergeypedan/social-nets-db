# frozen_string_literal: true

require_relative "../tag_helper"

 module Integral
  class SocialNet
    module FontAwesome

      include TagHelper

      def fa_icon(**options)
        fail ArgumentError, "A Hash with options must be passed" unless options.is_a?(Hash)

        return unless fa_id

        color = options.has_key?(:color) ? !!options.delete(:color) : true

        defaults = {
          style: ("color: #{record[:color]}" if color),
          class: ["fa", "fa-#{fa_id}"]
        }

        style_value    = merge_style_values(existing: defaults[:style], incoming: options.delete(:style))
        class_value    = merge_class_values(existing: defaults[:class], incoming: options.delete(:class))
        attributes_str = tag_attributes_to_s({ class: class_value, style: style_value }.merge(options))

        return "<span #{attributes_str}></span>"
      end

    end
  end
end
