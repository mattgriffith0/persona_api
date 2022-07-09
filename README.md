# PersonaApi

The easiest and most complete rubygem for the [Persona](https://withpersona.com/) API. Currently supports [APIv1](https://docs.withpersona.com/reference/introduction)

## Installation

Add this line to your application's Gemfile:

    $ gem 'persona_api', github: "mattgriffith0/persona_api.rb"

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install persona_api

## Usage

To access the API, you'll need to create a `PersonaAPI::Client` and pass in your API key. You can find your API key in your [Persona dashboard](https://app.withpersona.com/dashboard/api-configuration).

```ruby
client = PersonaApi::Client.new(api_key: ENV["PERSONA_API_KEY"])
```
The client then gives you access to all of the resources.

## Resources

The gem attempts to map as closely as possible to the Persona API so that you can easily convert API examples in to gem code.

Responses are created as Objects like `PersonaAPI::Account`. Having types like `PersonaAPI::Inquiry` is useful for understanding the type of object you're working with. They're built using OpenStruct so that data is easily accessible in a Rubyish way.

##### Pagination

 `list` endpoints return pages of results. The result object will have a `data` key to access the results, as well as metadata like `next_page` and `prev_page` for retrieving the next and previous pages. You may also specify the number of results you would like to have returned, and for some resources, other specific filter params.

```ruby
results = client.inquiries.list("page[size]": 5)
#=> PersonaAPI::Collection

results.data
#=> [#<PersonaAPI::Inquiry>, #<PersonaAPI::Inquiry>]

results.next_page
#=> "inq_NiHBQW47WfdPT58m4VcqFebx"

# Retrieve the next page
client.inquiries.list("page[after]" 5, next_page: results.next_page)
#=> PersonaAPI::Collection
```

### Accounts

```ruby
client.accounts.list
client.accounts.create({})
client.accounts.retrieve(act_id: "id")
client.accounts.update(act_id: "id", {})
client.accounts.redact(act_id: "id")
client.accounts.add_tag(act_id: "id", {})
client.accounts.remove_tag(act_id: "id", {})
client.accounts.set_all_tags(act_id: "id", {})
```

### Inquiries

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/persona_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/persona_api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PersonaApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/persona_api/blob/master/CODE_OF_CONDUCT.md).
