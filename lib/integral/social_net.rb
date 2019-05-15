# frozen_string_literal: true

require_relative "support"
require_relative "social_net/version"
require_relative "social_net/data"
require_relative "social_net/font_awesome"

module Integral
  class SocialNet

    # To have methods both on class & instance
    extend  Support
    include Support
    include FontAwesome

    def initialize(uid)
      fail ArgumentError, "Social net UID must be provided (like \"facebook\"), you passed #{uid.inspect}" unless present_str?(uid)
      @uid = uid
      fail(ArgumentError, "Social net with UID #{uid} is not supported. Currently supported UIDs are: #{self.class.uids.join(", ")}") unless self.class.uid_supported? @uid
    end

    [:color, :fa_id, :name, :uid, :url].each do |method_symbol|
      define_method(method_symbol) do
        to_h[method_symbol]
      end
    end


    def user_page(username: nil, account_id: nil)
      fail ArgumentError, "Either a username or an account id must be provided" if !present_str?(username) && !present_str?(account_id)
      page = to_h[:user_page]

      username_template = page[:by_username]
      return username_template.sub "${username}", username if username && present_str?(username_template)

      account_id_template = page[:by_account_id]
      return account_id_template.sub "${account_id}", account_id  if account_id && present_str?(account_id_template)
    end


    def user_page_methods
      [:account_id, :username].select { |key| present_str? to_h[:user_page]["by_#{key}".to_sym] }
    end

    def to_h
      fail StandardError, "@uid is nil" unless @uid
      self.class.send :find_hash_by_uid, @uid
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
        return find_by_uid(uid)   if present_str?(uid)
        return find_by_name(name) if present_str?(name)
        fail ArgumentError, "`name:` or `uid:` must be provided. You are passing name: #{name.inspect}, uid: #{uid.inspect}"
      end

      def names
        DB.map { |record| record[:name] }
      end

      def uids
        DB.map { |record| record[:uid] }
      end

      private def find_by_name(name)
        return unless record = DB.select { |record| record[:name] == name }.first
        find_by_uid record[:uid]
      end

      private def find_by_uid(uid)
        self.new(uid) rescue nil
      end

      private def find_hash_by_uid(uid)
        DB.select { |record| record[:uid] == uid }.first
      end

      def uid_supported?(uid)
        uids.include? uid
      end

    end

  end
end
