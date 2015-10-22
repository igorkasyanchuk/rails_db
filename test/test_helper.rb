# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

puts "TRYING TO USE DB: #{ENV['DB'] || 'default'}"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"

puts "USING DB: #{RailsDb::Database.adapter.adapter_name}"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

def clean_db
  if ActiveRecord::Base.connection.table_exists? :t
    ActiveRecord::Base.connection.drop_table :t
  end
  ActiveRecord::Base.connection.tables.map(&:classify).map{|name| name.constantize if Object.const_defined?(name)}.compact.each(&:delete_all)
end