require 'rubygems'
require 'active_record'
require 'rack'
require 'rack/server'
require 'erb'

HOST = '0.0.0.0'
PORT = 12345

database_yml = ::File.expand_path(File.join('.', 'config', 'database.yml'))
app_path     = ::File.expand_path(File.join('.'))

ENV['DATABASE_YML_PATH'] = database_yml

require ::File.expand_path('../../test/standalone/config/environment', __FILE__)

puts      "Using database.yml from: #{database_yml}"
db_conf   = YAML.load(ERB.new(File.open(database_yml).read).result) || {}
env       = ENV['RAILS_ENV'] || ENV['ENV'] || 'development'
db_env    = db_conf[env]

if db_env['adapter'] == 'sqlite3'
  db_env['database'] = "#{app_path}/#{db_env['database']}"
end

puts      "ENV: #{db_env.inspect}"

ActiveRecord::Base.establish_connection(db_env)
RailsDb.use_default_configuration!

Thread.new {
  begin
    require 'launchy'
    Launchy.open("http://#{HOST}:#{PORT}/rails/db")
  rescue Exception
    # silence
    # in case it won't work
  end
}

puts "Starting RailsDB on #{"http://#{HOST}:#{PORT}/rails/db"} ..."

Rack::Handler::WEBrick.run Rails.application, { Host: HOST, Port: PORT }

