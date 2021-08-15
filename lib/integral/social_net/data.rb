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
          by_account_id: "https://behance.com/${account_id}"
        }
      }, {
        name:  "Bitchute",
        uid:   "bitchute",
        fa_id:  nil,
        color: "#ef4137",
        url:   "https://bitchute.com",
        user_page: {
          by_username:   "https://bitchute.com/profile/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Bitclout",
        uid:   "bitclout",
        fa_id:  nil,
        color: "#ef4137",
        url:   "https://bitclout.com",
        user_page: {
          by_username:   "https://bitclout.com/u/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Blogger",
        uid:   "blogger",
        fa_id: "link",
        color: "#ff8000",
        url:   "https://blogger.com",
        user_page: {
          by_username:   "https://${username}.blogspot.com",
          by_account_id:  nil
        }
      }, {
        name:  "Discord",
        uid:   "discord",
        fa_id:  nil,
        color: "#7289da",
        url:   "https://discord.com",
        user_page: {
          by_username:    nil,
          by_account_id: "https://discord.gg/${account_id}"
        }
      }, {
        name:  "Dribble",
        uid:   "dribble",
        fa_id: "dribble",
        color: "#ea4c89",
        url:   "https://dribble.com",
        user_page: {
          by_username:   "https://dribble.com/${username}",
          by_account_id: "https://dribble.com/${account_id}"
        }
      }, {
        name:  "Facebook",
        uid:   "facebook",
        fa_id: "facebook",
        color: "#3C5A99",
        url:   "https://facebook.com",
        user_page: {
          by_username:   "https://facebook.com/${username}",
          by_account_id: "https://facebook.com/${account_id}"
        }
      }, {
        name:  "FL",
        uid:   "fl.ru",
        fa_id:  nil,
        color: "#4ea828",
        url:   "https://fl.ru",
        user_page: {
          by_username:   "https://fl.ru/users/${username}/",
          by_account_id:  nil
        }
      }, {
        name:  "Flote",
        uid:   "flote",
        fa_id:  nil,
        color: "#01f",
        url:   "https://flote.app",
        user_page: {
          by_username:   "https://flote.app/user/${username}/",
          by_account_id:  nil
        }
      }, {
        name:  "Фрилансим",
        uid:   "freelansim",
        fa_id:  nil,
        color: "#4abfb4",
        url:   "https://freelansim.ru",
        user_page: {
          by_username:   "https://freelansim.ru/freelancers/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Gab",
        uid:   "gab",
        fa_id:  nil,
        color: "#21cf7a",
        url:   "https://gab.com",
        user_page: {
          by_username:   "https://gab.com/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Gettr",
        uid:   "gettr",
        fa_id:  nil,
        color: "#ff0013",
        url:   "https://gettr.com",
        user_page: {
          by_username:   "https://gettr.com/user/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Habrahabr",
        uid:   "habr",
        fa_id:  nil,
        color: "#65a3be",
        url:   "https://habr.com",
        user_page: {
          by_username:   "https://habr.com/ru/users/${username}/",
          by_account_id:  nil
        }
      }, {
        name:  "GitHub",
        uid:   "github",
        fa_id: "github",
        color: "#333333",
        url:   "https://github.com",
        user_page: {
          by_username:   "https://github.com/${username}",
          by_account_id: "https://github.com/${account_id}"
        }
      }, {
        name:  "GitLab",
        uid:   "gitlab",
        fa_id: "gitlab",
        color: "#fa7035",
        url:   "https://gitlab.com",
        user_page: {
          by_username:   "https://gitlab.com/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Instagram",
        uid:   "instagram",
        fa_id: "instagram",
        color: "#e1306c",
        url:   "https://instagram.com",
        user_page: {
          by_username:   "https://instagram.com/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "LBRY",
        uid:   "lbry",
        fa_id:  nil,
        color: "#38d9a9",
        url:   "https://lbry.tv/@RedPillPhilosophy",
        user_page: {
          by_username:   "https://lbry.tv/@${username}",
          by_account_id:  nil
        }
      }, {
        name:  "LinkedIn",
        uid:   "linkedin",
        fa_id: "linkedin",
        color: "#0077b5",
        url:   "https://linkedin.com",
        user_page: {
          by_username:   "https://linkedin.com/in/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "LiveJournal",
        uid:   "livejournal",
        fa_id: "livejournal",
        color: "#00A3D9",
        url:   "https://livejournal.com",
        user_page: {
          by_username:   "https://${username}.livejournal.com",
          by_account_id:  nil
        }
      }, {
        name:  "Locals",
        uid:   "locals",
        fa_id:  nil,
        color: "#e73348",
        url:   "https://locals.com",
        user_page: {
          by_username:   "https://${username}.locals.com",
          by_account_id:  nil
        }
      }, {
        name:  "Manosphere",
        uid:   "manosphere",
        fa_id:  nil,
        color: "#d84c47",
        url:   "https://manosphere.tv",
        user_page: {
          by_username:   "https://manosphere.tv/@${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Medium",
        uid:   "medium",
        fa_id: "medium",
        color: "#00ab6c",
        url:   "https://medium.com",
        user_page: {
          by_username:   "https://${username}.medium.com",
          by_account_id:  nil
        }
      }, {
        name:  "Мой мир",
        uid:   "my.mail.ru",
        fa_id:  nil,
        color: "#005FF9",
        url:   "https://my.mail.ru",
        user_page: {
          by_username:   "https://my.mail.ru/mail/${username}/",
          by_account_id:  nil
        }
      }, {
        name:  "Odysee",
        uid:   "odysee",
        fa_id:  nil,
        color: "#000000",
        url:   "https://odysee.com",
        user_page: {
          by_username:   "https://odysee.com/@${username}/",
          by_account_id:  nil
        }
      }, {
        name:  "Одноклассники",
        uid:   "odnoklassniki",
        fa_id: "odnoklassniki",
        color: "#e47d08",
        url:   "https://ok.ru",
        user_page: {
          by_username:   "https://ok.ru/${username}/",
          by_account_id:  nil
        }
      }, {
        name:  "PayPal",
        uid:   "paypal",
        fa_id: "paypal",
        color: "#0070ba",
        url:   "https://paypal.com",
        user_page: {
          by_username:   "https://paypal.me/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Patreon",
        uid:   "patreon",
        fa_id:  nil,
        color: "#ff424d",
        url:   "https://patreon.com",
        user_page: {
          by_username:   "https://patreon.com/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "RemoteOK",
        uid:   "remoteok",
        fa_id:  nil,
        color: "#ff4742",
        url:   "https://remoteok.io",
        user_page: {
          by_username:   "https://remoteok.io/@${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Rumble",
        uid:   "rumble",
        fa_id: "play-circle",
        color: "#74a441",
        url:   "https://rumble.com",
        user_page: {
          by_username:   "https://rumble.com/c/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "StackOverflow",
        uid:   "stackoverflow",
        fa_id: "stackoverflow",
        color: "#F48024",
        url:   "https://stackoverflow.com",
        user_page: {
          by_username:   nil,
          by_account_id: "https://stackoverflow.com/users/${account_id}?tab=profile"
        }
      }, {
        name:  "SubscribeStar",
        uid:   "subscribestar",
        fa_id:  nil,
        color: "#ff4081",
        url:   "https://subscribestar.com",
        user_page: {
          by_username:   "https://subscribestar.com/${username}",
          by_account_id: nil
        }
      }, {
        name:  "SubStack",
        uid:   "substack",
        fa_id:  nil,
        color: "#ff4081",
        url:   "https://substack.com",
        user_page: {
          by_username:   "https://${username}.substack.com",
          by_account_id: nil
        }
      }, {
        name:  "Telegram",
        uid:   "telegram",
        fa_id: "telegram",
        color: "#0088cc",
        url:   "https://telegram.com",
        user_page: {
          by_username:   "https://t.me/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "TikTok",
        uid:   "tiktok",
        fa_id:  nil,
        color: "#fe2c55",
        url:   "https://tiktok.com",
        user_page: {
          by_username:   "https://tiktok.com/@${username}",
          by_account_id:  nil
        }
      }, {
        name:  "Twitter",
        uid:   "twitter",
        fa_id: "twitter",
        color: "#1da1f2",
        url:   "https://twitter.com",
        user_page: {
          by_username:   "https://twitter.com/${username}",
          by_account_id:  nil
        }
      }, {
        name:  "UpWork",
        uid:   "upwork",
        fa_id:  nil,
        color: "#37A000",
        url:   "https://upwork.com",
        user_page: {
          by_username:   nil,
          by_account_id: "https://upwork.com/freelancers/~${account_id}"
        }
      }, {
        name:  "Вконтакте",
        uid:   "vkontakte",
        fa_id: "vk",
        color: "#45668e",
        url:   "https://vkontakte.com",
        user_page: {
          by_username:   "https://vk.com/${username}",
          by_account_id: "https://vk.com/id${account_id}"
        }
      }, {
        name:  "YouTube",
        uid:   "youtube",
        fa_id: "youtube",
        color: "#ff0000",
        url:   "https://youtube.com",
        user_page: {
          by_username:   "https://youtube.com/c/${username}",
          by_account_id: "https://youtube.com/channel/${account_id}"
        }
      }, {
        name:  "Web site",
        uid:   "website",
        fa_id: "link",
        color: "#ff0000",
        url:    nil,
        user_page: {
          by_username:   "${username}",
          by_account_id:  nil
        }
      }
    ].freeze
  end
end
