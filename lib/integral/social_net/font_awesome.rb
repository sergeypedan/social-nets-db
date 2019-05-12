# frozen_string_literal: true

require_relative "../tag_helper"

 module Integral
  class SocialNet
    module FontAwesome

      include TagHelper

      def fa_icon(**options)
        return unless fa_id

        color = options.has_key?(:color) ? !!options.delete(:color) : true

        (options = {}) unless options.is_a?(Hash)

        defaults = {
          style: ("color: #{record[:color]}" if color),
          class: ["fa", "fa-#{fa_id}"]
        }

        style_value = if options.has_key? :style
                        [defaults[:style], "#{options.delete(:style)};"].join("; ").gsub(";;", ";")
                      else
                        defaults[:style]
                      end

        class_value = if options.has_key? :class
                        [defaults[:class], options.delete(:class)]
                      else
                        defaults[:class]
                      end

        attributes_str = tag_attributes_to_s({ class: class_value, style: style_value }.merge(options))

        return "<span #{attributes_str}></span>"
      end

    end
  end
end
