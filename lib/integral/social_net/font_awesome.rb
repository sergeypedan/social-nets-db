# frozen_string_literal: true

module Integral
  class SocialNet
    module FontAwesome

      def fa_icon(color: true)
        color_attribute = color ? " style=\"color: #{record[:color]}\"" : nil
        "<span class=\"fa fa-#{fa_id}\"#{color_attribute}></span>"
      end

    end
  end
end
