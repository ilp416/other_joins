# OtherJoins

Add obvious `left_joins`, `outer_joins`, `full_joins` methods to ActiveRecord as plain way to join tables.

## Introdution
Usually to join tables in Rails app you use something like this:
```ruby
User.joins(:orders)
# SELECT "users".* FROM "users"
# INNER JOIN "orders" ON "orders"."user_id" = "users"."id"
```
Well, more living example. We want to get users with count of orders:
```ruby
User.joins(:orders).group('users.name').count('orders.id')
# SELECT COUNT(orders.id) AS count_orders_id, users.name AS users_name
# FROM "users"
# INNER JOIN "orders" ON "orders"."user_id" = "users"."id"
# GROUP BY users.name
 => {"Nick"=>2, "Sandra"=>3}
```
But if we want to get all users and count of orders, even else orders empty. We call `OUTER JOIN` by handwriting SQL: 
```ruby
User.joins('LEFT OUTER JOIN orders ON orders.user_id = users.id').group('users.name').count('orders.id')
# SELECT COUNT(orders.id) AS count_orders_id, users.name AS users_name
# FROM "users"
# LEFT OUTER JOIN orders ON orders.user_id = users.id
# GROUP BY users.name
 => {"Juan"=>0, "Nick"=>2, "Sandra"=>3}
 ```
Not difficult, but it is bored and ungracefully. Instinctively we want to use `left_join` or `outer_join` etc.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'other_joins'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install other_joins

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ilp416/other_joins. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
