module ActionDispatch::Routing
  class Mapper
    def mount_rails_db_routes(options = {})
      mount RailsDb::Engine => '/rails/db', :as => options[:as] || 'rails_db'
    end
  end
end