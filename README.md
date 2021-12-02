# Social nets DB

[![Gem Version](https://badge.fury.io/rb/social_nets_db.svg)](https://badge.fury.io/rb/social_nets_db)

## Installation

```ruby
gem "social_nets_db"
```


## Internals

It stores data about popular social nets, video hostings etc. in a YAML file [`db.yml`](https://github.com/sergeypedan/social-nets-db/blob/master/lib/social_nets_db/db.yml):

```yaml
behance:
  name: Behance
  icons:
    font_awesome_4: behance
  color: "#1769ff"
  domain: behance.com
  tags:
    - art
    - design
    - recruiting
  profile_url:
    by_username: "https://${domain}/${uid}"
    by_account_id: "https://${domain}/${uid}"
```

Everything else is just helpers around this simple DB: finders, accessors & view helpers.


## Usage

There are 2 primary use cases for this gem:

### 1. To help create lists of links to social net accounts

Like in the footer of a website:

```ruby
ruby:
  accounts = [
    { net_uid: "instagram", username: "dhh" },
    { net_uid: "facebook",  username: "d-h-h" },
    { net_uid: "twitter",   username: "d_h_h" },
    { net_uid: "upwork",    account_id: "401298374012374" },
    { net_uid: "email",     username: "elon@musk.io" },
    { net_uid: "website",   username: "musk.io" }
  ]

ul
  - accounts.each do |account|
    - net = SocialNetsDB::SocialNet.find account[:net_uid]
    li
      - fa_icon_uid = net.icons["font_awesome_4"] || "link"
      = fa_icon fa_icon_uid, class: "fw", style: "color: #{net.color}"
      =< link_to net.name, \
                 net.user_page(username: account[:username], account_id: account[:account_id]), \
                 target: "_blank", rel: "noopener noreferrer"
```

Here the gem:

- builds the URL to user page

	```ruby
	net.user_page(username: account[:username]) #=> "https://facebook.com/dhh"
	```

- gives you the correct name of the social net

	```ruby
	net.name #=> "Facebook"
	```

### 2. To help building a `<select>` with social nets when storing user's account link

```ruby
= form_for @user do |f|
  = f.fields_for :social_net_accounts do |sna|
    .form-group
      = sna.label  :social_net_uid, class: "control-label"
      = sna.select :social_net_uid, SocialNetsDB::SocialNet.values_for_select, {}, class: "form-control"
```

which produces

```html
<form action="/users" method="POST">
  <div class="form-group">
    <label for="user_social_net_accounts_attributes_123_social_net_uid">Social net UID</label>
    <select required="required" class="form-control" name="user[social_net_accounts_attributes][123][social_net_uid]">
      <option value="">Choose a social net:</option>
      <option value="behance">Behance</option>
      <option value="dribble">Dribble</option>
      <option value="facebook">Facebook</option>
      <!-- ... -->
    </select>
  </div>
</form>
```

See section “[Using with Rails](#use-with-rails)” below for more details.


## API

### Find a social net record

Use either one:

```ruby
social_net = SocialNetsDB::SocialNet.find("facebook")
social_net = SocialNetsDB::SocialNet.find_by(uid: "facebook")
social_net = SocialNetsDB::SocialNet.find_by_uid("facebook")
# => #<SocialNetsDB:0x00007fddc0041b40 @uid="facebook">
```

Which are supported UIDs?

```ruby
SocialNetsDB.uids
#=> [
#    "behance",
#    "dribble",
#    "facebook",
#    "fl.ru",
#    "freelansim",
#    "habr",
#    "github",
#    "instagram",
#    ...
#  ]
```

### Data

```ruby
social_net.to_h #=>
# {
#   "name"   => "Facebook",
#   "icons"  => { "font_awesome_4" => "facebook" },
#   "color"  => "#3C5A99",
#   "domain" => "facebook.com",
#   "tags"   => ["social net"],
#   "profile_url" => {
#     "by_username"   => "https://${domain}/${uid}",
#     "by_account_id" => "https://${domain}/${uid}"
#   }
# }
```

### Property accessors

```ruby
social_net.color  #=> "#3C5A99"
social_net.name   #=> "Facebook"
social_net.uid    #=> "facebook"
social_net.domain #=> "facebook.com"
social_net.url    #=> "https://facebook.com"
social_net.icons  #=> { "font_awesome_4" => "facebook" }
```

### FontAwesome icon

```ruby
social_net.icons["font_awesome_4"] #=> "facebook"
```

Currently, only FontAwesome v4 icons are store. I plan adding newer version of FA, maybe other icon providers, and also SVGs.

### User's page URL

```ruby
social_net.user_page(username: "dhh")              #=> "https://facebook.com/dhh"
social_net.user_page(account_id: "id1234566789")   #=> "https://facebook.com/account/id1234566789"
```

If you pass a username, while the `SocialNet` supports user page URLs only via account ids, the method call will return `nil`.

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
      = sna.select :social_net_uid, SocialNetsDB::SocialNet.values_for_select, {}, class: "form-control"
```

because

```ruby
SocialNetsDB::SocialNet.values_for_select
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

This would be a standard approach:

```ruby
# model SocialNet < ApplicationRecord
#   has_many :social_net_accounts
# end
```

but instead we will use `SocialNetsDB::SocialNet` class instead of an ActiveRecord class:

```ruby
SocialNetsDB::SocialNet.find("facebook")
SocialNetsDB::SocialNet.find_by(uid: "facebook")
```

```ruby
model SocialNetAccount < ApplicationRecord
  belongs_to :user

  validates :account_id,     presence: true, if: Proc.new { |record| record.username.blank? }
  validates :social_net_uid, presence: true, inclusion: { in: SocialNetsDB.uids }
  validates :username,       presence: true, if: Proc.new { |record| record.account_id.blank? }

  def social_net
    @social_net ||= SocialNetsDB::SocialNet.find(self.social_net_uid)
  end

  def user_page
    social_net.user_page(username: self.username, account_id: self.account_number)
  end

  #  id              :bigint  not null, primary key
  #  user_id         :bigint  not null
  #  account_id      :string            example: `id1230948712034871`
  #  social_net_uid  :string  not null  example: `facebook`, `vkontakte`
  #  username        :string            example, `tenderlove`
  #  userpic_url     :string
end
```

It's probably better to move those 2 methods into a decorator — here they are in the model just for brevity.

```ruby
SocialNetAccount.create(user_id: User.first.id, social_net_uid: "facebook", username: "tenderlobe")
```

```ruby
@user.social_net_accounts.first.user_page  #=> "https://facebook.com/tenderlove"
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
