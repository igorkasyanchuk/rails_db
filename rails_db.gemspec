$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_db/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_db"
  s.version     = RailsDb::VERSION
  s.authors     = ["Igor Kasyanchuk"]
  s.email       = ["igorkasyanchuk@gmail.com"]
  s.homepage    = "https://github.com/igorkasyanchuk/rails_db"
  s.summary     = "Inspect your Rails DB (table content viewer, execute sql queries, export & import data"
  s.description = "Quick way to inspect your Rails database, see content of tables, export them to CSV, EXPLAIN SQL and run SQL queries."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "font-awesome-rails"
  s.add_dependency "foundation-rails"
  s.add_dependency "sass"
  s.add_dependency "sass-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency 'codemirror-rails'

  s.add_development_dependency 'populator'
  s.add_development_dependency 'faker'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2"
  s.add_development_dependency "pry"
end
