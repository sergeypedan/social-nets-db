# Integral::SocialNet

## Installation

```ruby
gem "integral-social_nets", github: "sergeypedan/integral-social-nets", require: "integral-social_net"
```

Note that it's necessary to add `require: "integral-social_net"` because the gem name `integral-social_nets` (plural) does not match the base class name `integral/social_net.rb` (singular).

Alternatively, you can omit requiring `"integral-social_net"` in `Gemfile` and require it somewhere within the application (`application.rb` in Rails, for example)


## Internals

It stores data about social nets in a Ruby hash like so:

```ruby
DB = [
  {
    name:  "Behance",
    uid:   "behance",
    fa_id: "behance",
    color: "#1769ff",
    url:  "https://behance.com",
    user_page: {
      by_username:   "https://behance.com/${username}",
      by_account_id: "https://behance.com/${account_id}",
      methods:       [:account_id, :username]
    }
  },
  # ...
]
```

[Peek into the source](https://github.com/sergeypedan/integral-social-nets/blob/master/lib/integral/social_net/data.rb).

Everything else is just helpers around this simple DB: finders, accessors & view helpers.


## Usage

### Instance of `Integral::SocialNet` class

Initialize an instance with social net UID.

```ruby
social_net = Integral::SocialNet.new("facebook")
# => #<Integral::SocialNet:0x00007fddc0041b40 @uid="facebook">
```

Which are supported UIDs? Try an unsupported UID, and you will get the list:

```ruby
Integral::SocialNet.new("diaspora")
# ArgumentError (Social net with UID test is not supported.
#
# Currently supported UIDs are: behance, dribble, facebook, github, instagram, livejournal, linkedin, medium, my.mail.ru, odnoklassniki, stackoverflow, telegram, twitter, vkontakte, youtube)
```

### Data

```ruby
social_net.record
# => {
#      name:  "Facebook",
#      uid:   "facebook",
#      fa_id: "facebook",
#      color: "crimson",
#      url:  "https://facebook.com",
#      user_page: {
#        by_username:   "https://facebook.com/${username}",
#        by_account_id: "https://facebook.com/${account_id}",
#        methods:       [:account_id, :username]
#      }
#    }
```

### Property accessors

```ruby
social_net.color       #=> "#3C5A99"
social_net.fa_icon_id  #=> "facebook"
social_net.name        #=> "Facebook"
social_net.uid         #=> "facebook"
social_net.url         #=> "https://facebook.com"
```

### FontAwesome icon

Assumes you have [FontAwesome](https://fontawesome.com/v4.7.0/) installed. Just builds the HTML tag.

```ruby
social_net.fa_icon
#=> <span class="fa fa-facebook" style="color: #3C5A99"></span>
```

It accepts a Hash with attributes, like Rails `tag_helper` (but not for `data: {}` — maybe later):

```ruby
social_net.fa_icon(class: "fa-fw", id: "my-id", style: "margin-top: 10px")
#=> <span class="fa fa-facebook fa-fw" style="color: #3C5A99; margin-top: 10px;" id="my-id"></span>
```

Exporting social net brand color to `styles` attribute can be turned off by passing `color: false` Hash pair among others:

```ruby
social_net.fa_icon(color: false, class: "fa-fw", id: "my-id", style: "margin-top: 10px")
#=> <span class="fa fa-facebook fa-fw" style="cmargin-top: 10px;" id="my-id"></span>
```

### User's page URL

```ruby
social_net.user_page(username: "dhh")              #=> "https://facebook.com/dhh"
social_net.user_page(account_id: "id1234566789")   #=> "https://facebook.com/account/id1234566789"
```

If you pass a username, whild the `SocialNet` supports user page URLs only via account ids, the method call will return `nil`.

You can check which is supported

```ruby
social_net.user_page_methods  #=> [:account_id, :username]
```


## Use with Rails

This gem is Rails-agnostic, but you can use it in Rails like so:

### Forms

```ruby
= form_for @user do |f|
  = f.fields_for :social_net_accounts do |sna|
    .form-group
      = sna.label  :social_net_uid, class: "control-label"
      = sna.select :social_net_uid, Integral::SocialNet.select_options, {}, class: "form-control"
```

because

```ruby
Integral::SocialNet.select_options
#=> [
#     ["Behance",       "behance"],
#     ["Dribble",       "dribble"],
#     ["Facebook",      "facebook"],
#     ["GitHub",        "github"],
#     ["Instagram",     "instagram"],
#     ["LiveJournal",   "livejournal"],
#     ["LinkedIn",      "linkedin"],
#     ["Medium",        "medium"],
#     ["Мой мир",       "my.mail.ru"],
#     ["Одноклассники", "odnoklassniki"],
#     ["StackOverflow", "stackoverflow"],
#     ["Telegram",      "telegram"],
#     ["Twitter",       "twitter"],
#     ["Вконтакте",     "vkontakte"],
#     ["YouTube",       "youtube"]
#  ]
```

### Models

```ruby
model User < ApplicationRecord
  has_many :social_net_accounts
end
```

```ruby
model SocialNetAccount < ApplicationRecord
  belongs_to :user

  validates :account_id,     presence: true, if: Proc.new { |record| record.username.blank? }
  validates :social_net_uid, presence: true, inclusion: { in: Integral::SocialNet.uids }
  validates :username,       presence: true, if: Proc.new { |record| record.account_id.blank? }

  def social_net
    @social_net ||= Integral::SocialNet.new(self.social_net_uid)
  end

  def user_page
    social_net.user_page(username: self.username, account_id: self.account_number)
  end

  #  id                                            :bigint           not null, primary key
  #  user_id                                       :bigint           not null

  #  account_id(for example, `id1230948712034871`) :string
  #  social_net_uid(`facebook`, `vkontakte` etc.)  :string           not null
  #  username(for example, `tenderlove`)           :string
  #  userpic_url                                   :string
end
```

It's probably better to move those 2 methods into a decorator — here they are in the model just for brevity.

```ruby
@user = User.first
social_net_account = SocialNetAccount.create(user_id: @user.id, social_net_uid: "facebook", username: "tenderlobe")
@user.social_net_accounts << social_net_account
```

```ruby
@user.social_net_accounts.first.user_page  #=> "https://facebook.com/tenderlove"
```


## Contributing

Fork and build your own — or send a pull request.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
