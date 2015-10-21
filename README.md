# Rails DB

[![Build Status](https://travis-ci.org/igorkasyanchuk/rails_db.svg)](https://travis-ci.org/igorkasyanchuk/rails_db)

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/account_table.png?token=AAArXeu9-vtuW8nIvc9RE0nOIhGbwxkbks5WKlTLwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

Quick way to inspect your Rails database **http://localhost:3000/rails/db**, see content of tables, export them to CSV, EXPLAIN SQL and run SQL queries.

Demo available on: https://rails-db.herokuapp.com/rails/db/

Video Demo: https://www.youtube.com/watch?v=ZBY9YPQdbx8

## Requirements

For now was tested only with Ruby 2.2 and Rails 4.2. But expected to work with older versions too.

## Main Features

* view content of DB tables
* sort content of DB tables
* execute SQL queries
* filter tables for easier navigation
* use history of you SQL queries
* see EXPLAIN results for your queries
* export data to CSV
* import SQL files
* expand/collapse sidebar
* added HTTP_BASIC auth for Rails DB
* ability to turn on/off using initializer
* visualize SQL schema (future)
* data-tables inside your app (future)
* ajax-ify Rails DB (future)
* CRUD for table records (future)
* white/black list of tables (future)

## Install

Add this to the development group in your `Gemfile`

For all environments (be careful with production environment):

```ruby
  gem 'rails_db'
```

Or only for development:

```ruby
  group :development do
    gem 'rails_db'
  end
```

Run `bundle install`

Visit **`http://localhost:3000/rails/db`** and you will see your database tables and SQL editors.

## Samples

### Schema

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/accounts_schema.png?token=AAArXU_ChN3xNN2MajLy2Tv98ij6XK4Pks5WKlT3wA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

### SQL Editor

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/execute_sql.png?token=AAArXf26vwsPwvV2MhgxWUepGb0tT6g4ks5WKlUJwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

Install & visit **`http://localhost:3000/rails/db`** to see it in action.

## Contributing

- Fork it
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Added some feature')
- Push to the branch (git push origin my-new-feature)
- Create new Pull Request

## Plans

* add specs
* verify all environments
* add DB schema visualization
* add import

## License

This project uses MIT-LICENSE.
