# frozen_string_literal: true

require_relative "social_net/version"
require_relative "social_net/data"

module Integral
  class SocialNet

    def initialize(uid)
      fail ArgumentError, "Social net UID must be provided (like \"facebook\"), you passed #{uid.inspect}" unless present?(uid)
      record || fail(ArgumentError, "Social net with `uid` #{uid} not supported. Currently supported: #{self.class.uids.join(", ")}")
      @uid = uid
    end

    def fa_icon
      "<span class=\"fa fa-#{fa_id}\" style=\"color: #{record[:color]}\"></span>".html_safe
    end

    [:color, :fa_id, :name, :uid, :url].each do |method_symbol|
      define_method(method_symbol) do
        self.record[method_symbol]
      end
    end

    def page_url(username: nil, account_id: nil)
      return record[:page_url][:by_username  ].sub "${username}",   username   if present?(username)
      return record[:page_url][:by_account_id].sub "${account_id}", account_id if present?(account_id)
      fail ArgumentError, "Either a username or an account id must be provided"
    end

    def record
      @record ||= self.class.find_by(uid: @uid)
    end

    private def present?(string)
      string && string != ""
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
        return DB.select { |record| record[:uid]  == uid  }.first if present?(uid)
        return DB.select { |record| record[:name] == name }.first if present?(name)
        fail ArgumentError, "`name:` or `uid:` must be provided. You are passing name: #{name.inspect}, uid: '#{uid.inspect}'"
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
