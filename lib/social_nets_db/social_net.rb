# frozen_string_literal: true

class SocialNetsDB
	class SocialNet

		# To have methods both on class & instance
		extend  Support
		include Support
		extend  FnValidations
		include FnValidations

		# @param [String, Symbol] uid Social net UID (which must be among the top-level keys in db.yml)
		# @param [Hash] data
		#
		def initialize(uid, data)
			validate_argument_type! data, Hash
			validate_argument_type! uid, [String, Symbol]
			@data, @uid = data, uid
		end

		attr_accessor :uid

		[:color, :domain, :icons, :name, :tags].each do |method_symbol|
			define_method(method_symbol) do
				fallback_value = method_symbol == :tags ? [] : nil
				@data.fetch(method_symbol.to_s, fallback_value)
			end
		end

		# @return [Hash] Raw data we have on the initialized social net
		#
		def to_h
			self.class.send :raw_data_for, @uid
		end

		# @return [String] full URL of the social net
		#
		def url
			"https://#{domain}"
		end

		# @return [String] full URL of user’s page in the social net
		# @param [String, Symbol, Integer] username
		# @param [String, Symbol, Integer] username
		# @example
		#   SocialNetsDB::SocialNet.find("facebook").user_page(username: "dhh")
		#   #=> "https://facebook.com/dhh"
		#
		def user_page(username: nil, account_id: nil)
			return unless page = to_h["profile_url"]
			fail(ArgumentError, "Either a username or an account id must be provided") if [username, account_id].none?
			if    username   &&  page["by_username"]
					validate_argument_type! username, [String, Symbol, Integer]
					page["by_username"].sub("${domain}", domain.to_s).sub("${uid}", username.to_s)
			elsif account_id &&  page["by_account_id"]
					validate_argument_type! account_id, [String, Symbol, Integer]
					page["by_account_id"].sub("${domain}", domain.to_s).sub("${uid}", account_id.to_s)
			end
		end

		# @return [Array] available methods for bilding user page URL
		#
		def user_page_methods
			["account_id", "username"].select { |key| present_str? to_h.dig("profile_url", "by_#{key}") }
		end


		# Class methods

		class << self

			# TODO this must be transofrmed into array of structs
			# @return [Array<SocialNetsDB::SocialNet>] a list of all social nets initialized as objects
			def all
				RECORDS.map { |uid, data| new(uid, data) }
			end


			# @param [String] name Social network name
			# @param [String, Symbol] uid Social network UID
			# @return [SocialNetsDB::SocialNet, nil]
			#
			def find_by(name: nil, uid: nil)
				return find_by_uid(uid)   if present_str?(uid)
				return find_by_name(name) if present_str?(name)
				fail ArgumentError, "`name:` or `uid:` must be provided. You are passing name: #{name.inspect}, uid: #{uid.inspect}"
			end


			# @param [String] name Social network name
			# @return [SocialNetsDB::SocialNet, nil]
			#
			def find_by_name(name)
				validate_argument_presence! name
				return unless record = RECORDS.select { |uid, data| data["name"] == name }.first
				find_by_uid record[0]
			end


			# @param [String, Symbol] uid Social network UID
			# @return [SocialNetsDB::SocialNet, nil]
			#
			def find_by_uid(uid)
				validate_argument_type! uid, String
				validate_argument_presence! uid

				# unless uids.include?(@uid = uid)
				#   fail ArgumentError, "Social net with UID #{uid} is not recognized. Currently supported UIDs are: #{uids.join(", ")}. To add a new social net, send us a PR."
				# end
				return unless data = raw_data_for(uid)
				self.new(uid, data)
			end

			private def raw_data_for(uid)
				RECORDS[uid.to_s]
			end

			def names
				RECORDS.map { |uid, data| data["name"] }
			end

			def uids
				RECORDS.keys.map(&:to_s)
			end

			def values_for_select
				RECORDS.map { |uid, data| [data["name"], uid] }
			end

			alias_method :find, :find_by_uid

		end

	end
end
