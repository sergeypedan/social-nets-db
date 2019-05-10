# frozen_string_literal: true

module Integral
  class SocialNet
    DB = [
      {
        name:  "Behance",
        uid:   "behance",
        fa_id: "behance",
        color: "crimson",
        url:  "https://behance.com",
        user_page: {
          by_username:   "https://behance.com/${username}",
          by_account_id: "https://behance.com/${account_id}"
        }
      }, {
        name:  "Dribble",
        uid:   "dribble",
        fa_id: "dribble",
        color: "crimson",
        url:  "https://dribble.com",
        user_page: {
          by_username:   "https://dribble.com/${username}",
          by_account_id: "https://dribble.com/${account_id}"
        }
      }, {
        name:  "Facebook",
        uid:   "facebook",
        fa_id: "facebook",
        color: "crimson",
        url:  "https://facebook.com",
        user_page: {
          by_username:   "https://facebook.com/${username}",
          by_account_id: "https://facebook.com/${account_id}"
        }
      }, {
        name:  "GitHub",
        uid:   "github",
        fa_id: "github",
        color: "crimson",
        url:  "https://github.com",
        user_page: {
          by_username:   "https://github.com/${username}",
          by_account_id: "https://github.com/${account_id}"
        }
      }, {
        name:  "Instagram",
        uid:   "instagram",
        fa_id: "instagram",
        color: "crimson",
        url:  "https://instagram.com",
        user_page: {
          by_username:   "https://instagram.com/${username}",
          by_account_id: "https://instagram.com/${account_id}"
        }
      }, {
        name:  "LiveJournal",
        uid:   "livejournal",
        fa_id: "livejournal",
        color: "#00A3D9",
        url:  "https://livejournal.com",
        user_page: {
          by_username:   "https://${username}.livejournal.com",
          by_account_id: nil
        }
      }, {
        name:  "LinkedIn",
        uid:   "linkedin",
        fa_id: "linkedin",
        color: "",
        url:  "https://linkedin.com",
        user_page: {
          by_username:   "https://linkedin.com/in/${username}",
          by_account_id: nil
        }
      }, {
        name:  "LiveJournal",
        uid:   "medium",
        fa_id: "medium",
        color: "",
        url:  "https://medium.com",
        user_page: {
          by_username:   "https://${username}.medium.com",
          by_account_id: nil
        }
      }, {
        name:  "Мой мир",
        uid:   "my.mail.ru",
        fa_id: "",
        color: "#005FF9",
        url:  "https://my.mail.ru",
        user_page: {
          by_username:   "https://my.mail.ru/mail/${username}/",
          by_account_id: nil
        }
      }, {
        name:  "Одноклассники",
        uid:   "odnoklassniki",
        fa_id: "odnoklassniki",
        color: "#e47d08",
        url:  "https://ok.ru",
        user_page: {
          by_username:   "https://ok.ru/${username}/",
          by_account_id: nil
        }
      }, {
        name:  "StackOverflow",
        uid:   "stackoverflow",
        fa_id: "stackoverflow",
        color: "crimson",
        url:  "https://stackoverflow.com",
        user_page: {
          by_username:   "https://stackoverflow.com/${username}",
          by_account_id: "https://stackoverflow.com/${account_id}"
        }
      }, {
        name:  "Telegram",
        uid:   "telegram",
        fa_id: "telegram",
        color: "crimson",
        url:  "https://telegram.com",
        user_page: {
          by_username:   "https://telegram.com/${username}",
          by_account_id: "https://telegram.com/${account_id}"
        }
      }, {
        name:  "Twitter",
        uid:   "twitter",
        fa_id: "twitter",
        color: "crimson",
        url:  "https://twitter.com",
        user_page: {
          by_username:   "https://twitter.com/${username}",
          by_account_id: nil
        }
      }, {
        name:  "Вконтакте",
        uid:   "vkontakte",
        fa_id: "vk",
        color: "crimson",
        url:  "https://vkontakte.com",
        user_page: {
          by_username:   "https://vkontakte.com/${username}",
          by_account_id: "https://vkontakte.com/${account_id}"
        }
      }, {
        name:  "YouTube",
        uid:   "youtube",
        fa_id: "youtube",
        color: "crimson",
        url:  "https://youtube.com",
        user_page: {
          by_username:   "https://youtube.com/${username}",
          by_account_id: "https://youtube.com/${account_id}"
        }
      }
    ].freeze
  end
end