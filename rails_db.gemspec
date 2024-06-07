$:.push File.expand_path("../lib", __FILE__)

require "rails_db/version"

Gem::Specification.new do |s|
  s.name        = "rails_db"
  s.version     = RailsDb::VERSION
  s.authors     = ["Igor Kasyanchuk"]
  s.email       = ["igorkasyanchuk@gmail.com"]
  s.homepage    = "https://github.com/igorkasyanchuk/rails_db"
  s.summary     = "Inspect your Rails DB (table content viewer, execute sql queries, export & import data"
  s.description = "Quick way to inspect your Rails database, see content of tables, filter, export them to CSV, Excel, EXPLAIN SQL and run SQL queries."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib,test}/**/*", "rails_db.gemspec", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.rdoc", "bin/rails_db", "bin/railsdb", "bin/runsql"]
  s.test_files = Dir["test/**/*"]

  s.executables   = ["railsdb", "rails_db", 'runsql']

  s.add_dependency 'rails', ">= 5.0.0"
  s.add_dependency 'terminal-table'
  s.add_dependency 'simple_form', '>= 5.0.1'
  s.add_dependency 'activerecord'
  s.add_dependency 'ransack', '>= 2.3.2'
  s.add_dependency 'kaminari'
  s.add_dependency 'sprockets-rails'
  s.add_dependency 'csv'

  s.add_development_dependency "launchy"
  s.add_development_dependency "sqlite3", '~> 1.4'
  s.add_development_dependency "mysql2", '0.5.6'
  s.add_development_dependency "pg"
  s.add_development_dependency "caxlsx_rails"
  s.add_development_dependency 'will_paginate', '>= 3.1.0'
  s.add_development_dependency 'mime-types'
  s.add_development_dependency 'paranoia'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'puma'
  # s.add_development_dependency 'populator'
  # s.add_development_dependency 'faker'
  # s.add_development_dependency 'pry'
end
