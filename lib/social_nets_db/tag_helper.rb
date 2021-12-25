# frozen_string_literal: false

require_relative "support"

module TagHelper

	include Support

	def tag_attributes_to_s(options)
		fail ArgumentError, "A Hash must be passed, you pass #{options.class}: #{options.inspect}" unless options.is_a? Hash
		options.map { |pair| stringify_pair(*pair) }
					 .reject { |stringified_attribute| [nil, ""].include?(stringified_attribute) }
					 .join(" ")
	end

	private def stringify_pair(attribute_name, attribute_value)
		str_value = stringify_value(attribute_value)
		return "" if [nil, ""].include? str_value
		"#{attribute_name}=\"#{str_value}\""
	end

	private def stringify_value(value)
		value.is_a?(Array) ? value.join(" ") : value.to_s
	end

	def merge_style_values(existing:, incoming:)
		return existing unless present_str? incoming
		[existing, "#{incoming};"].join("; ").gsub(";;", ";")
	end

	def merge_class_values(existing:, incoming:)
		return existing unless present_str? incoming
		[existing, incoming]
	end

end
