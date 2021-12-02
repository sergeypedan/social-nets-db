# frozen_string_literal: true

require "yaml"

require_relative "social_nets_db/version"
require_relative "social_nets_db/fn_validations"
require_relative "social_nets_db/support"
require_relative "social_nets_db/tag_helper"
require_relative "social_nets_db/social_net"

class SocialNetsDB

  # RECORDS = recursively_symbolize_keys(YAML.load_file(File.expand_path("social_nets_db/db.yml", __dir__))).freeze
  # RECORDS = YAML.load_file(File.expand_path("social_nets_db/db.yml", __dir__)).map { _1.transform_keys(&:to_sym) }.freeze
  RECORDS = YAML.load_file(File.expand_path("social_nets_db/db.yml", __dir__)).freeze

end
