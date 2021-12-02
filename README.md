# Social nets DB

## Installation

```ruby
gem "social_nets_db"
```


## Internals

It stores data about social nets in a Ruby hash like so:

```yaml
-
  name: Behance
  uid: behance
  icons:
    font_awesome: "behance"
  color: "#1769ff"
  url: behance.com
  tags:
    - recruiting
    - art
    - design
  profile_url:
    by_username: https://behance.com/${username}
    by_account_id: "https://behance.com/${account_id}"
```

[Peek into the source](https://github.com/sergeypedan/social-nets-db/blob/master/lib/social_net_db/db.yml).

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
    { net_uid: "upwork",    account_id: "401298374012374" }
  ]

ul
  - accounts.each do |account|
    - net = SocialNetsDB.find account[:net_uid]
    li
      = fa_icon net.icons["font_awesome"], style: "color: #{net.color}"
      =< link_to net.name, \
                 net.user_page(username: account[:username], account_id: account[:account_id]), \
                 target: "_blank", \
                 rel: "noopener noreferrer"
```

Here the gem:

- builds the URL to user page

	```ruby
	net.user_page(username: account[:username])
	# "https://facebook.com/dhh"
	```

- gives you the correct name of the social net

	```ruby
	net.name
	# "Facebook"
	```

### 2. To help building a `<select>` with social nets when storing user's account link

```ruby
= form_for @user do |f|
  = f.fields_for :social_net_accounts do |sna|
    .form-group
      = sna.label  :social_net_uid, class: "control-label"
      = sna.select :social_net_uid, SocialNetsDB.values_for_select, {}, class: "form-control"
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

### Instance of `SocialNetsDB` class

Initialize an instance with social net UID.

```ruby
social_net = SocialNetsDB.find("facebook")
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
#    "livejournal",
#    "linkedin",
#    "medium",
#    "my.mail.ru",
#    "odnoklassniki",
#    "stackoverflow",
#    "telegram",
#    "twitter",
#    "upwork",
#    "vkontakte",
#    "youtube"
#  ]
```

If you try to initialize with an unsupported UID, and you will also get the list along with an Exception:

```ruby
SocialNetsDB.find("diaspora")
# ArgumentError (Social net with UID test is not supported.
#
# Currently supported UIDs are: behance, dribble, facebook, github, instagram, livejournal, linkedin, medium, my.mail.ru, odnoklassniki, stackoverflow, telegram, twitter, vkontakte, youtube)
```

### find_by

If you don't want to rescue exceptions while initializing, you can use `find_by(uid:)` instead.

It returns an instance:

```ruby
SocialNetsDB.find_by(uid: "facebook")
# => #<SocialNetsDB:0x00007fddc0041b40 @uid="facebook">
```

or `nil`:

```ruby
SocialNetsDB.find_by(uid: "blabla")
# => nil
```

### Data

```ruby
social_net.to_h
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
      = sna.select :social_net_uid, SocialNetsDB.values_for_select, {}, class: "form-control"
```

because

```ruby
SocialNetsDB.values_for_select
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
  validates :social_net_uid, presence: true, inclusion: { in: SocialNetsDB.uids }
  validates :username,       presence: true, if: Proc.new { |record| record.account_id.blank? }

  def social_net
    @social_net ||= SocialNetsDB.find(self.social_net_uid)
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
