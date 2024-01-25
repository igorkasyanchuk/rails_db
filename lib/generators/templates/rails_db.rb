if Object.const_defined?('RailsDb')
  RailsDb.setup do |config|
    # # enabled or not
    # config.enabled = Rails.env.development?

    # # automatic engine routes mounting
    # config.automatic_routes_mount = true

    # set tables which you want to hide ONLY
    # config.black_list_tables = ['users', 'accounts']

    # set tables which you want to show ONLY
    # config.white_list_tables = ['posts', 'comments']

    # # Enable http basic authentication
    # config.http_basic_authentication_enabled = false

    # # Enable http basic authentication
    # config.http_basic_authentication_user_name = 'rails_db'

    # # Enable http basic authentication
    # config.http_basic_authentication_password = 'password'

    # # Enable http basic authentication
    # config.verify_access_proc = proc { |controller| true }

    # # Sandbox mode (only read-only operations)
    # config.sandbox = false

    # # Configure to use something else than ActiveRecord::Base
    # config.abstract_model_class = ApplicationRecord

    # # Configure for multi-database environments to switch base models in the GUI
    # config.available_abstract_model_classes = [ApplicationRecord, Tenant1::Base, Tenant2::Base]
  end
end