# Rails DB

Please share this gem with your friends to get more feedback. If you have ideas - please create an issue.

[![Build Status](https://travis-ci.org/igorkasyanchuk/rails_db.svg)](https://travis-ci.org/igorkasyanchuk/rails_db)
[![Gem Version](https://badge.fury.io/rb/rails_db.svg)](https://badge.fury.io/rb/rails_db)

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/account_table.png?token=AAArXeu9-vtuW8nIvc9RE0nOIhGbwxkbks5WKlTLwA%3D%3D"
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
* autocomplete for SQL queries
* filter tables for easier navigation
* use history of you SQL queries
* see EXPLAIN results for your queries
* export data to CSV
* import SQL files
* expand/collapse sidebar
* added HTTP_BASIC auth for Rails DB
* ability to turn on/off using initializer
* white/black list of tables
* data-tables inside your app
* ajax-ify Rails DB
* visualize SQL schema (future)
* CRUD for table records (future)

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

## Customization
If you want to customize gem run in console:

    rails g rails_db initializer

If will create file config/initializers/rails_db.rb.

### Options
*   **enabled** - enable of disable gem (default: true).
*   **automatic_routes_mount** - automatically mount engine routes in your app (default: true).
*   **http_basic_authentication_enabled** - Enable HTTP_BASIC authentication (default: false).
*   **http_basic_authentication_user_name** - HTTP_BASIC authentication user name.
*   **http_basic_authentication_password** - HTTP_BASIC authentication password.
*   **black_list_tables** - black list for tables (hide tables from sidebar).
*   **white_list_tables** - black list for tables (show only these tables in sidebar).

## Data Tables

You can add easily data-tables into your App with content from DB.

You can build data tables for whole Table, Table with specific columns or based on SQL query.

```erb
<h3>Table</h3>

<%= rails_db_data_table table: 'accounts', footer: true, columns: ['id', 'name', 'users_count'], header: true, style: :bootstrap %>

<h3>SQL</h3>

<%= rails_db_data_table_sql sql: 'select id, name, age from users order by age desc limit 10', footer: false, header: true %>
```

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/data_table_code.png?token=AAArXU_ChN3xNN2MajLy2Tv98ij6XK4Pks5WKlT3wA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

## Samples

### Schema

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/accounts_schema.png?token=AAArXU_ChN3xNN2MajLy2Tv98ij6XK4Pks5WKlT3wA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

### SQL Editor

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/execute_sql.png?token=AAArXf26vwsPwvV2MhgxWUepGb0tT6g4ks5WKlUJwA%3D%3D"
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
