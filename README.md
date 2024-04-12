# Ryze

Ryze is a Ruby gem that provides a simple interface to the League of Legends Riot API.

**Please note that this gem is still in development and is not yet ready for production use.**

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add Ryze

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install Ryze


## Documentation

The documentation for this gem can be found [here](https://rubydoc.info/github/clement0910/Ryze/master)

## Usage

To use the gem, you must first obtain an API key from Riot.
You can do so by visiting the [Riot Developer Portal](https://developer.riotgames.com/).

Than, you can create a new client by passing your API key as an argument:

```ruby
require 'ryze'

client = Ryze::Client.new(api_key: 'YOUR_API_KEY')
```

You can then use the client to make requests to the Riot API:

```ruby
client.account.retrieve_account_by_riot_id(summoner_name: 'SAKEN')
```

## Roadmap

- Finish implementing RBS files
- Add methods to Object classes to make it easier to access data
- Add tests
- Add possibility to change region
- Finish implementing all endpoints

## Endpoints

- [X] Account-v1
- [X] Summoner-v4
- [ ] Match-v5
- [ ] Champion-Mastery-v4
- [ ] Spectator-V4
- [ ] League-V4

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/clement0910/Ryze. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/clement0910/Ryze/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
