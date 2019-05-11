# frozen_string_literal: true

module Support

  def present_str?(string)
    string && string != "" && string.is_a?(String)
  end

end
