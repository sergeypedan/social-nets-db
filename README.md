# Integral::SocialNet

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem "integral-social_nets", github: "sergeypedan/integral-social-nets", require: "integral-social_net"
```

And then execute:

```sh
bundle install
```

## Usage

### Select in forms

```ruby
.form-group
  = f.label  :social_net_uid, class: "control-label"
  = f.select :social_net_uid, Integral::SocialNet.select_options, {}, class: "form-control"
```

### Accessing properties

```ruby
social_net = Integral::SocialNet.new("facebook")

social_net.fa_icon     #=> <span class="fa fa-facebook" style="color: blue"></span>>
social_net.color       #=> "crimson"
social_net.fa_icon_id  #=> "facebook"
social_net.name        #=> "Facebook"
social_net.uid         #=> "facebook"
social_net.url         #=> "https://facebook.com"
```

### User' page URL

```ruby
social_net = Integral::SocialNet.new("facebook")

social_net.page_url(username: "dhh")              #=> "https://facebook.com/dhh"
social_net.page_url(account_id: "id1234566789")   #=> "https://facebook.com/account/id1234566789"
```

### Self

```ruby
social_net = Integral::SocialNet.new("facebook")

social_net.record
# => {
  name:  "Facebook",
  uid:   "facebook",
  fa_id: "facebook",
  color: "crimson",
  url:  "https://facebook.com",
  user_page: {
    by_username:   "https://facebook.com/${username}",
    by_account_id: "https://facebook.com/${account_id}"
  }
}
```

### Assumptions

This gem is Rails-agnostic, but you can use it in Rails like so:

```ruby
model User
  has_many :social_net_accounts
end

model SocialNetAccount
  belongs_to :user

  def social_net
    @social_net ||= Integral::SocialNet.new(self.social_net_uid)
  end

  def page_url
    social_net.page_url(username: self.username, account_id: self.account_number)
  end

  #  id                                            :bigint           not null, primary key
  #  user_id                                       :bigint           not null

  #  account_id(for example, `id1230948712034871`) :string
  #  social_net_uid(`facebook`, `vkontakte` etc.)  :string           not null
  #  username(for example, `tenderlove`)           :string
  #  userpic_url                                   :string
end
```

## Contributing

Fork and build your own — or send pull requests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
