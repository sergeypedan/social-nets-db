# frozen_string_literal: true

module Integral
  class SocialNet
    DB = [
      {
        name:  "Behance",
        uid:   "behance",
        fa_id: "behance",
        color: "#1769ff",
        url:   "https://behance.com",
        user_page: {
          by_username:   "https://behance.com/${username}",
          by_account_id: "https://behance.com/${account_id}",
          methods:       [:account_id, :username]
        }
      }, {
        name:  "Dribble",
        uid:   "dribble",
        fa_id: "dribble",
        color: "#ea4c89",
        url:   "https://dribble.com",
        user_page: {
          by_username:   "https://dribble.com/${username}",
          by_account_id: "https://dribble.com/${account_id}",
          methods:       [:account_id, :username]
        }
      }, {
        name:  "Facebook",
        uid:   "facebook",
        fa_id: "facebook",
        color: "#3C5A99",
        url:   "https://facebook.com",
        user_page: {
          by_username:   "https://facebook.com/${username}",
          by_account_id: "https://facebook.com/${account_id}",
          methods:       [:account_id, :username]
        }
      }, {
        name:  "FL",
        uid:   "fl.ru",
        fa_id: nil,
        color: "#4ea828",
        url:   "https://fl.ru",
        user_page: {
          by_username:   "https://www.fl.ru/users/${username}/",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "Фрилансим",
        uid:   "freelansim",
        fa_id: nil,
        color: "#4abfb4",
        url:   "https://freelansim.ru",
        user_page: {
          by_username:   "https://freelansim.ru/freelancers/${username}",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "Habrahabr",
        uid:   "habr",
        fa_id: nil,
        color: "#65a3be",
        url:   "https://habr.com",
        user_page: {
          by_username:   "https://habr.com/ru/users/${username}/",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "GitHub",
        uid:   "github",
        fa_id: "github",
        color: "#333333",
        url:   "https://github.com",
        user_page: {
          by_username:   "https://github.com/${username}",
          by_account_id: "https://github.com/${account_id}",
          methods:       [:account_id, :username]
        }
      }, {
        name:  "Instagram",
        uid:   "instagram",
        fa_id: "instagram",
        color: "#e1306c",
        url:   "https://instagram.com",
        user_page: {
          by_username:   "https://www.instagram.com/${username}",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "LiveJournal",
        uid:   "livejournal",
        fa_id: "livejournal",
        color: "#00A3D9",
        url:   "https://livejournal.com",
        user_page: {
          by_username:   "https://${username}.livejournal.com",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "LinkedIn",
        uid:   "linkedin",
        fa_id: "linkedin",
        color: "#0077b5",
        url:   "https://linkedin.com",
        user_page: {
          by_username:   "https://linkedin.com/in/${username}",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "Medium",
        uid:   "medium",
        fa_id: "medium",
        color: "#00ab6c",
        url:   "https://medium.com",
        user_page: {
          by_username:   "https://${username}.medium.com",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "Мой мир",
        uid:   "my.mail.ru",
        fa_id: "",
        color: "#005FF9",
        url:   "https://my.mail.ru",
        user_page: {
          by_username:   "https://my.mail.ru/mail/${username}/",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "Одноклассники",
        uid:   "odnoklassniki",
        fa_id: "odnoklassniki",
        color: "#e47d08",
        url:   "https://ok.ru",
        user_page: {
          by_username:   "https://ok.ru/${username}/",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "StackOverflow",
        uid:   "stackoverflow",
        fa_id: "stackoverflow",
        color: "#F48024",
        url:   "https://stackoverflow.com",
        user_page: {
          by_username:   nil,
          by_account_id: "https://stackoverflow.com/users/${account_id}?tab=profile",
          methods:       [:account_id]
        }
      }, {
        name:  "Telegram",
        uid:   "telegram",
        fa_id: "telegram",
        color: "#0088cc",
        url:   "https://telegram.com",
        user_page: {
          by_username:   "https://t.me/${username}",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "Twitter",
        uid:   "twitter",
        fa_id: "twitter",
        color: "#1da1f2",
        url:   "https://twitter.com",
        user_page: {
          by_username:   "https://twitter.com/${username}",
          by_account_id: nil,
          methods:       [:username]
        }
      }, {
        name:  "UpWork",
        uid:   "upwork",
        fa_id: "upwork",
        color: "#37A000",
        url:   "https://upwork.com",
        user_page: {
          by_username:   nil,
          by_account_id: "https://www.upwork.com/freelancers/~${account_id}",
          methods:       [:account_id]
        }
      }, {
        name:  "Вконтакте",
        uid:   "vkontakte",
        fa_id: "vk",
        color: "#45668e",
        url:   "https://vkontakte.com",
        user_page: {
          by_username:   "https://vkontakte.com/${username}",
          by_account_id: "https://vkontakte.com/${account_id}",
          methods:       [:account_id, :username]
        }
      }, {
        name:  "YouTube",
        uid:   "youtube",
        fa_id: "youtube",
        color: "#ff0000",
        url:   "https://youtube.com",
        user_page: {
          by_username:   "https://youtube.com/${username}",
          by_account_id: "https://youtube.com/${account_id}",
          methods:       [:account_id, :username]
        }
      }
    ].freeze
  end
end
