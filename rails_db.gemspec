$:.push File.expand_path("../lib", __FILE__)

require "rails_db/version"

Gem::Specification.new do |s|
  s.name        = "rails_db"
  s.version     = RailsDb::VERSION
  s.authors     = ["Igor Kasyanchuk"]
  s.email       = ["igorkasyanchuk@gmail.com"]
  s.homepage    = "https://github.com/igorkasyanchuk/rails_db"
  s.summary     = "Inspect your Rails DB (table content viewer, execute sql queries, export & import data"
  s.description = "Quick way to inspect your Rails database, see content of tables, export them to CSV, EXPLAIN SQL and run SQL queries."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "rails_db.gemspec", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.rdoc", "bin/rails_db", "bin/railsdb", "bin/runsql"]
  s.test_files = Dir["test/**/*"]

  s.executables   = ["railsdb", "rails_db", 'runsql']

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "font-awesome-rails"
  s.add_dependency "sass"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency 'codemirror-rails'
  s.add_dependency 'launchy'
  s.add_dependency "sqlite3"
  s.add_dependency "mysql2", '<= 0.3.20'
  s.add_dependency "pg"
  s.add_dependency 'terminal-table'
  s.add_dependency 'therubyracer'
end