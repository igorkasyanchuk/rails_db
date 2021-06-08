module RailsDb
  class Engine < ::Rails::Engine
    isolate_namespace RailsDb
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'rails_db.assets_precompile', :group => :all do |app|
      app.config.assets.precompile += [
        'rails_db/application.js', 
        'rails_db/application.css',
        'rails_db/logo.png',
        'rails_db/logo_mini.png',
        'rails_db/data_table_code.png',
        'rails_db/data_table.png',
        'rails_db/railsdb.png',
        'rails_db/runsql.png',
        'rails_db/*.png', 
        'codemirror/*', 
        'codemirror/**/*'
      ]
    end

    initializer 'rails_db.helpers' do
      ActiveSupport.on_load :action_view do
        include RailsDb::Helpers
      end
    end
  end
end
