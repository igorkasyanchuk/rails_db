RailsDb.setup do |config|
  # # enabled or not
  # config.enabled = true

  # automatic engine routes mouting
  config.automatic_routes_mount = false

  # set tables which you want to hide ONLY
  # config.black_list_tables = ['users']

  # set tables which you want to show ONLY
  # config.white_list_tables = ['comments']

  # # Enable http basic authentication
  # config.http_basic_authentication_enabled = true

  # # Enable http basic authentication
  # config.http_basic_authentication_user_name = 'rails_db'

  # # Enable http basic authentication
  # config.http_basic_authentication_password = 'password'
  config.verify_access_proc = proc { |e| true }
end