# Rails DB

Please **share** this gem with your friends to get more feedback.

If you have ideas - please create an issue or contact me by email: `igorkasyanchuk[@]gmail.com`.

[![Build Status](https://travis-ci.org/igorkasyanchuk/rails_db.svg)](https://travis-ci.org/igorkasyanchuk/rails_db)
[![Gem Version](https://badge.fury.io/rb/rails_db.svg)](https://badge.fury.io/rb/rails_db)

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/home.png?token=AAArXeu9-vtuW8nIvc9RE0nOIhGbwxkbks5WKlTLwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)
[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/railsdb.png?token=AAArXeu9-vtuW8nIvc9RE0nOIhGbwxkbks5WKlTLwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)
[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/runsql.png?token=AAArXeu9-vtuW8nIvc9RE0nOIhGbwxkbks5WKlTLwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)


Quick way to inspect your Rails database **http://localhost:3000/rails/db**, see content of tables, export them to CSV, EXPLAIN SQL and run SQL queries.

Demo available on: https://rails-db.herokuapp.com/rails/db/

Video Demo: https://www.youtube.com/watch?v=ZBY9YPQdbx8

## Requirements

For now was tested manually only with Ruby 2.X, and Rails 4.X. But expected to work with older versions too. Also there are automated tests running on Travis CI.

## Main Features

* command line tools `railsdb` and `runsql` to run app and sql for your apps.
* view content and schema of DB tables (including indexes)
* sort content of DB tables
* execute SQL queries
* autocomplete for SQL queries
* filter tables for easier navigation
* use history of you SQL queries
* see EXPLAIN results for your queries
* export data to CSV
* import SQL files
* expand/collapse sidebar
* allow access for current user for example with appropriate role
* added HTTP_BASIC auth for Rails DB
* ability to turn on/off using initializer
* white/black list of tables
* data-tables inside your app
* ajax-ify Rails DB
* delete records, truncate tables
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

If you want to customize gem (create initializer) run in console:

    rails g rails_db initializer

If will create file config/initializers/rails_db.rb.

### Options
*   **enabled** - enable or disable gem (default: true).
*   **automatic_routes_mount** - automatically mount engine routes in your app (default: true).
*   **http_basic_authentication_enabled** - Enable HTTP_BASIC authentication (default: false).
*   **http_basic_authentication_user_name** - HTTP_BASIC authentication user name.
*   **http_basic_authentication_password** - HTTP_BASIC authentication password.
*   **black_list_tables** - black list for tables (hide tables from sidebar).
*   **white_list_tables** - black list for tables (show only these tables in sidebar).
*   **verify_access_proc** - allow access by specific conditions, for example by role for current_user (default: `proc { |controller| true }`)

If you want to add routes manually (or customize the mounted location) you need to first turn off automatic_routes_mount and then add to your `routes.rb`

```ruby
  mount RailsDb::Engine => '/rails/db', :as => 'rails_db'
```

If you wanted to only allow access to admins and, for example, you are using Devise you could do following (in `config/initializers/rails_db.rb`)

```ruby
  config.verify_access_proc = proc { |controller| controller.current_user.admin? }
```

## Data Tables

You can easily embed data-tables into your App with content from DB.

You can build data tables for the whole Table, Table with specific columns or based on SQL query.

Below you can see samples on how you can embed data-tables directly in your app.

```erb
<h3>Table</h3>

<%= rails_db_data_table 'accounts',
                        footer: true,
                        columns: ['id', 'name', 'users_count'],
                        header: true,
                        style: :bootstrap %>

<h3>SQL</h3>

<%= rails_db_data_table_sql 'select id, name, age from users order by age desc limit 10',
                            footer: false,
                            header: true %>
```

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/data_table_code.png?token=AAArXU_ChN3xNN2MajLy2Tv98ij6XK4Pks5WKlT3wA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

## Samples & Screenshots

### Schema

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/autocomplete.png?token=AAArXU_ChN3xNN2MajLy2Tv98ij6XK4Pks5WKlT3wA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)


[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/accounts_schema.png?token=AAArXU_ChN3xNN2MajLy2Tv98ij6XK4Pks5WKlT3wA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

### SQL Editor

Rails App SQL editor with syntax highlight and code complete.

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/execute_sql.png?token=AAArXf26vwsPwvV2MhgxWUepGb0tT6g4ks5WKlUJwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

Install & visit **`http://localhost:3000/rails/db`** to see it in action.

### RailsDB Standalone

Run RailsDB Standalone commands locally withing configuration of your `config/database.yml`

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/railsdb.png?token=AAArXf26vwsPwvV2MhgxWUepGb0tT6g4ks5WKlUJwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

### RunSQL Util

Run SQL commands locally withing configuration of your `config/database.yml`

[<img src="https://raw.githubusercontent.com/igorkasyanchuk/rails_db/master/docs/runsql.png?token=AAArXf26vwsPwvV2MhgxWUepGb0tT6g4ks5WKlUJwA%3D%3D"
/>](https://rails-db.herokuapp.com/rails/db/)

## Contributing

- Fork it
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Added some feature')
- Push to the branch (git push origin my-new-feature)
- Create new Pull Request

## Local Development

- Checkout it
- cd test/dummy
- bundle
- rake db:migrate
- rails s
- open http://locahost:3000/

## Run Tests

To run tests locally you need to execute `rake test` withing root folder of project.

After your push to git, all tests will be executed on Travis CI environment.

You can also change locally DB to verify gem accross multiple Databases (mysql, postgres, sqlite). For more details see `test/dummy/config/database.yml` (you need to set DB ENV variable).

## Common Issues and Solutions

- "Invalid css error" - https://github.com/igorkasyanchuk/rails_db/issues/11
- "Automatic routes mounting" - https://github.com/igorkasyanchuk/rails_db/issues/4
- "uninitialised constant Sass::Script" - https://github.com/igorkasyanchuk/rails_db/issues/13

## Plans

* Add more tests
* Verify all environments
* Add DB schema visualization
* Create WIKI pages, improve documentation

## License

This project uses MIT-LICENSE.
