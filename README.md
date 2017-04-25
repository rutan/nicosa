# Nicosa

[![Build Status](https://travis-ci.org/rutan/nicosa.svg?branch=master)](https://travis-ci.org/rutan/nicosa)

niconico search API client.

- [コンテンツ検索APIドキュメント](http://site.nicovideo.jp/search-api-docs/search.html)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nicosa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nicosa

## Usage

```ruby
require 'nicosa'

client = Nicosa::Client.new(service: :video, user_agent: 'TODO: Your Address')
# or
client = Nicosa::Services::Video.new(user_agent: 'TODO: Your Address')

response = client.search('keyword') # => Nicosa::Response
response.each do |n|
  puts n.title
  puts n.url
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rutan/nicosa.

## License
MIT

