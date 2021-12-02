# frozen_string_literal: true

module Support

  extend FnValidations

  # Direct analogue of Rails' `String#present?`
  #
  # @return [Boolean] is the passed argument is a non-empty String
  # @param arg [Any] the thing to check
  #
  def present_str?(arg)
    arg.is_a?(String) && arg != ""
  end

  # From https://avdi.codes/recursively-symbolize-keys/
  #
  def recursively_symbolize_keys(hash)
    validate_argument_type! hash, Hash
    hash.inject({}) { |result, (key, value)|
      new_key   = case key
                  when String then key.to_sym
                  else key
                  end

      new_value = case value
                  when Hash then symbolize_keys(value)
                  else value
                  end

      result[new_key] = new_value
      result
    }
  end

end
