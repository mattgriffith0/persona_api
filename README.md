# PersonaApi

The easiest and most complete rubygem for the [Persona](https://withpersona.com/) API. Currently supports [API v1](https://docs.withpersona.com/reference/introduction)

## Installation

Add this line to your application's Gemfile:

    gem 'persona_api', github: "mattgriffith0/persona_api.rb"

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

Responses are (in *almost* all cases) created as Objects like `PersonaAPI::Account`. Having types like `PersonaAPI::Inquiry` is useful for understanding the type of object you're working with. They're built using OpenStruct so that data is easily accessible in a Rubyish way.

##### Pagination

 `list` endpoints return pages of results. The result object will have a `data` key to access the results, as well as metadata like `next_page` and `prev_page` for retrieving the next and previous pages. You may also specify the number of results you would like to have returned and, for some resources, other specific filter params.

```ruby
results = client.inquiries.list("page[size]": 5)
#=> PersonaAPI::Collection

results.data
#=> [#<PersonaAPI::Inquiry>, #<PersonaAPI::Inquiry>]

results.next_page
#=> "inq_NiHBQW47WfdPT58m4VcqFebx"

# Retrieve the next page
client.inquiries.list("page[size]": 5, "page[after]": results.next_page)
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

### Cases

```ruby
client.cases.list
client.cases.create({})
client.cases.retrieve(case_id: "id")
client.cases.assign(case_id: "id", {})
client.cases.set_status(case_id: "id", {})
client.cases.add_persona_objects(case_id: "id", {})
```

### Documents

```ruby
client.documents.retrieve(doc_id: "id")
```

### Events

```ruby
client.events.list
client.events.retrive(evt_id:)
```

### Files

```ruby
client.files.download(file_id:, file_name:)
```

### Inquiries

```ruby
client.inquiries.list
client.inquiries.create({})
client.inquiries.retrieve(inq_id: "id")
client.inquiries.update(inq_id: "id", {})
client.inquiries.redact(inq_id: "id")
client.inquiries.add_tag(inq_id: "id", {})
client.inquiries.remove_tag(inq_id: "id", {})
client.inquiries.set_all_tags(inq_id: "id", {})
client.inquiries.resume(inq_id: "id")
client.inquiries.approve(inq_id: "id", {})
client.inquiries.decline(inq_id: "id", {})
```

### Lists

```ruby
client.lists.list
client.lists.retrieve(lst_id: "id")
client.lists.archive(lst_id: "id")
client.lists.create_browser_fingerprint_list({})
client.lists.create_country_list({})
client.lists.create_email_address_list({})
client.lists.create_face_list({})
client.lists.create_geolocation_list({})
client.lists.create_government_id_number_list({})
client.lists.create_ip_address_list({})
client.lists.create_name_list({})
client.lists.create_phone_number_list({})
```

### Reports

```ruby
client.reports.list
client.reports.create({})
client.reports.retrieve(rep_id: "id")
client.reports.redact(rep_id: "id")
client.reports.add_tag(rep_id: "id", {})
client.reports.remove_tag(rep_id: "id", {})
client.reports.set_all_tags(rep_id: "id", {})
```

### Verifications

```ruby
client.verifications.retrieve(ver_id: "id")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. This will create a `@client` for you to use, assuming you have assigned an API key to `ENV["PERSONA_API_KEY"]`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mattgriffith0/persona_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mattgriffith0/persona_api/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the PersonaApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mattgriffith0/persona_api/blob/master/CODE_OF_CONDUCT.md).


## Thanks
Massive thanks to [Chris Oliver](https://github.com/excid3), whose Vultr gem served as inspiration.

## License

[The MIT License (MIT)](https://github.com/mattgriffith0/persona_api/blob/main/LICENSE.txt)