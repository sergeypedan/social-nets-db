# frozen_string_literal: true

class SocialNetsDB
	class SocialNet

		# To have methods both on class & instance
		extend  Support
		include Support
		extend  FnValidations
		include FnValidations

		def initialize(uid, data)
			validate_argument_type! data, Hash
			validate_argument_type! uid, [String, Symbol]
			@data, @uid = data, uid
		end

		attr_accessor :uid

		[:color, :domain, :icons, :name].each do |method_symbol|
			define_method(method_symbol) do
				to_h[method_symbol.to_s]
			end
		end

		def to_h
			self.class.send :raw_data_for, @uid
		end

		def url
			"https://#{domain}"
		end

		def user_page(username: nil, account_id: nil)
			return unless page = to_h["profile_url"]
			return unless template = page["by_username"] || page["by_account_id"]
			uid = [username, account_id].select { present_str? _1 }.first or fail(ArgumentError, "Either a username or an account id must be provided")

			if    username && page["by_username"]
				fail ArgumentError, "Either a username or an account id must be provided" unless present_str?(username)
				template.sub("${domain}", domain.to_s).sub("${uid}", username)
			elsif account_id && page["by_account_id"]
				fail ArgumentError, "Either a username or an account id must be provided" unless present_str?(account_id)
				template.sub("${domain}", domain.to_s).sub("${uid}", account_id)
			end
		end

		def user_page_methods
			["account_id", "username"].select { |key| present_str? to_h.dig("profile_url", "by_#{key}") }
		end


		# Class methods

		class << self

			# TODO this must be transofrmed into array of structs
			def all
				RECORDS
			end

			# @param [String] name Social network name
			# @param [String, Symbol] uid Social network UID
			#
			def find_by(name: nil, uid: nil)
				return find_by_uid(uid)   if present_str?(uid)
				return find_by_name(name) if present_str?(name)
				fail ArgumentError, "`name:` or `uid:` must be provided. You are passing name: #{name.inspect}, uid: #{uid.inspect}"
			end

			def find_by_name(name)
				validate_argument_presence! name
				return unless record = RECORDS.select { |uid, data| data["name"] == name }.first
				find_by_uid record[0]
			end

			# @param [String, Symbol] uid Social network UID
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
