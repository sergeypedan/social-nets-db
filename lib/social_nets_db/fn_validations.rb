# frozen_string_literal: true

module FnValidations

	module_function

	def validate_argument_type! argument, permitted_types
		types      = Array(permitted_types)
		type_names = types.map { |klass| "`#{klass}`" }.join(" or ")
		valid      = types.any? { |type| argument.is_a? type }
		message    = "#{type_names} is expected, you pass a `#{argument.class}` (#{argument})"
		fail TypeError, message unless valid
		argument
	end

	def validate_collection_item_types! collection, permitted_types
		types      = Array(permitted_types)
		type_names = types.map { |name| "`#{name}`" }.join(" or ")
		valid      = collection.all? { |item| types.include?(item.class) }
		message    = "#{type_names} is expected, one the items you pass is of incorrect type"
		fail TypeError, message unless valid
		collection
	end

	def validate_argument_boolean! argument
		validate_argument_type! argument, [TrueClass, FalseClass]
	end

	def validate_argument_presence! argument
		validate_argument_type! argument, [String, Symbol]
		return argument if argument.is_a?(Symbol)
		message = "You must pass a non-empty String, you are passing #{argument.inspect}"
		fail ArgumentError, message unless argument.is_a?(String) && argument != ""
		argument
	end

	def validate_argument_positive! argument
		validate_argument_type! argument, Numeric
		message = "You must pass a positive value, you pass #{argument.inspect}"
		fail ArgumentError, message unless argument.positive?
		argument
	end

end

# RSpec.describe FnValidations do

#   include described_class

#   context "invalid input" do
#     it do expect { validate_argument_type! 1, String         }.to raise_exception(ArgumentError) end
#     it do expect { validate_argument_type! 1, [String]       }.to raise_exception(ArgumentError) end
#     it do expect { validate_argument_type! 1, [Hash, String] }.to raise_exception(ArgumentError) end
#   end

#   context "valid input" do
#     it do expect { validate_argument_type! 1, Integer         }.not_to raise_exception(ArgumentError) end
#     it do expect { validate_argument_type! 1, [Integer]       }.not_to raise_exception(ArgumentError) end
#     it do expect { validate_argument_type! 1, [Integer, Hash] }.not_to raise_exception(ArgumentError) end
#   end

#   context "valid by ancestory" do
#     it do expect { validate_argument_type! 1, Numeric     }.not_to raise_exception(ArgumentError) end
#     it do expect { validate_argument_type! [], Enumerable }.not_to raise_exception(ArgumentError) end
#   end

# end
