# frozen_string_literal: true

require_relative "social_net/version"
require_relative "social_net/data"
require_relative "social_net/support"

module Integral
  class SocialNet

    # To have methods both on class & instance
    extend  Support
    include Support

    def initialize(uid)
      fail ArgumentError, "Social net UID must be provided (like \"facebook\"), you passed #{uid.inspect}" unless present_str?(uid)
      @uid = uid
      fail(ArgumentError, "Social net with UID #{uid} is not supported. Currently supported UIDs are: #{self.class.uids.join(", ")}") unless record
    end

    def fa_icon(color: true)
      color_attribute = color ? " style=\"color: #{record[:color]}\"" : nil
      "<span class=\"fa fa-#{fa_id}\"#{color_attribute}></span>"
    end

    [:color, :fa_id, :name, :uid, :url].each do |method_symbol|
      define_method(method_symbol) do
        self.record[method_symbol]
      end
    end

    def user_page(username: nil, account_id: nil)
      fail ArgumentError, "Either a username or an account id must be provided" if !present_str?(username) && !present_str?(account_id)
      return record[:user_page][:by_username  ].sub "${username}",   username    if username
      return record[:user_page][:by_account_id].sub "${account_id}", account_id  if account_id
    end

    def record
      fail StandardError, "@uid is nil" if @uid.nil?
      self.class.find_by(uid: @uid)
    end


    # Class methods

    class << self

      def all
        DB
      end

      def select_options
        DB.map { |record| [ record[:name], record[:uid] ] }
      end

      def find_by(name: nil, uid: nil)
        return DB.select { |record| record[:uid]  == uid  }.first if present_str?(uid)
        return DB.select { |record| record[:name] == name }.first if present_str?(name)
        fail ArgumentError, "`name:` or `uid:` must be provided. You are passing name: #{name.inspect}, uid: #{uid.inspect}"
      end

      def names
        DB.map { |record| record[:name] }
      end

      def uids
        DB.map { |record| record[:uid] }
      end

    end

  end
end
