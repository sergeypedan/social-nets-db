# frozen_string_literal: true

require_relative "social_net/version"
require_relative "social_net/data"

module Integral
  class SocialNet

    def initialize(uid)
      validate_presence!(uid)
      self.class.find_by(uid: uid) || fail(ArgumentError, "Social net with `uid` #{uid} not supported. Currently supported: #{self.class.uids.join(", ")}")
      @uid = uid
    end

    def fa_icon_id
      record[:fa_icon]
    end

    def fa_icon
      "<span class=\"fa fa-#{fa_icon_id}\" style=\"color: #{record[:color]}\"></span>".html_safe
    end

    def page_url(username: nil, account_id: nil)
      return record[:page_url][:by_username  ].sub "${username}",   uid        if username
      return record[:page_url][:by_account_id].sub "${account_id}", account_id if account_id
      fail ArgumentError, "Either a username or an account id must be provided"
    end

    private def record
      self.class.find_by(uid: @uid)
    end

    private def validate_presence!(uid)
      fail ArgumentError, "`uid` must be provided, you passed #{uid.inspect}" if uid.nil? || uid == ""
    end


    # Class methods

    class << self

      def all
        DB
      end

      def for_select
        DB.map { |record| [ record[:name], record[:uid] ] }
      end

      def find_by(name: nil, uid: nil)
        fail ArgumentError, "Either `name` or `uid` must be provided" if [name, uid].all?(&:nil?)
        return DB.select { |record| record[:name] == name }.first unless uid
        return DB.select { |record| record[:uid]  == uid  }.first unless name
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
