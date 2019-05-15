# frozen_string_literal: true

require_relative "../tag_helper"

 module Integral
	class SocialNet
		module FontAwesome

			include TagHelper

			# Assumes you have [FontAwesome](https://fontawesome.com/v4.7.0/) installed. Just builds the HTML tag.
			#
			# ```ruby
			# social_net.fa_icon
			# #=> <span class="fa fa-facebook" style="color: #3C5A99"></span>
			# ```
			#
			# @return [String] HTML for FontAwesome tag, like `"<span class=\"fa fa-facebook\" style=\"color: #3C5A99\"></span>"`
			#
			# @param options [Hash] options like those you use in Rails TagHelper:
			#
			#   ```ruby
			#   fa_icon({ class: "fa-fw", id: "my-id", style: "margin-top: 10px" })
			#   ```
			#
			#   Curly braces are not required:
			#
			#   ```ruby
			#   fa_icon(class: "fa-fw", id: "my-id", style: "margin-top: 10px")
			#   ```
			#
			#   A non-HTML flag option may be passed to turn off emitting `style` tag with social net brand color, which is on by default:
			#
			#   ```ruby
			#   fa_icon(color: false)
			#   ```
			#
			def fa_icon(**options)
				fail ArgumentError, "A Hash with options must be passed" unless options.is_a?(Hash)

				fa_icon_id = fa_id || "link"
				show_color = options.has_key?(:color) ? !!options.delete(:color) : true

				defaults = {
					style: ("color: #{to_h[:color]}" if show_color),
					class: ["fa", "fa-#{fa_icon_id}"]
				}

				style_value    = merge_style_values(existing: defaults[:style], incoming: options.delete(:style))
				class_value    = merge_class_values(existing: defaults[:class], incoming: options.delete(:class))
				attributes_str = tag_attributes_to_s({ class: class_value, style: style_value }.merge(options))

				return "<span #{attributes_str}></span>"
			end

		end
	end
end
