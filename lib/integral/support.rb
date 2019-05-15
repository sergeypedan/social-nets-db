# frozen_string_literal: true

module Integral
  module Support

    # Direct analogue of Rails' `String#present?`
    #
    # @return [Boolean] is the passed argument is a non-empty String
    # @param arg [Any] the thing to check
    #
    def present_str?(arg)
      arg.is_a?(String) && arg != ""
    end

  end
end
