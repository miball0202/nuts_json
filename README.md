# NutsJson

This will help you create a fast and simple JSON serializer.  
Just write Hash and it becomes the Response Body.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nuts_json'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nuts_json

## Usage

```ruby
class UserSerializer < NutsJson::Serializer
  def key
    :user
  end

  def base(obj)
    {
      name: obj.name,
      email: obj.email
    }
  end
end
```

```ruby
class UsersController < ApplicationController
  def index
    users = User.all
  
    # response as Array
    render json: UserSerialier.new(users, :base).to_json, status: :ok
  end

  def show
    user = User.find(params[:id])

    # response as Object
    render json: UserSerialier.new(user, :base).to_json, status: :ok
  end
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/miball0202/nuts_json.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
