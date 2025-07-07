module RailsDb
  class Engine < ::Rails::Engine
    isolate_namespace RailsDb
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'rails_db.assets_precompile', :group => :all do |app|
      # Only configure asset precompilation if Sprockets is available
      if defined?(Sprockets) && app.config.respond_to?(:assets)
        app.config.assets.precompile += [
          # Original application files
          'rails_db/application.js', 
          'rails_db/application.css',
          
          # Individual CSS files for direct inclusion
          'rails_db/foundation.min.css',
          'rails_db/foundation_and_overrides.css',
          'rails_db/app.css',
          'rails_db/sidebar.css',
          'rails_db/pagination.css',
          'rails_db/table.css',
          'rails_db/forms.css',
          'rails_db/search.css',
          
          # Individual JS files for direct inclusion
          'rails_db/jquery.js',
          'rails_db/jquery.cookie.js',
          'rails_db/rails-ujs.js',
          'rails_db/foundation.min.js',
          'rails_db/sticky.js',
          'rails_db/show_hide_columns.js',
          'rails_db/search.js',
          
          # Images
          'rails_db/logo.png',
          'rails_db/logo_mini.png',
          'rails_db/data_table_code.png',
          'rails_db/data_table.png',
          'rails_db/railsdb.png',
          'rails_db/runsql.png',
          'rails_db/*.png', 
          
          # CodeMirror assets
          'codemirror/*', 
          'codemirror/**/*'
        ]
      end
    end

    initializer 'rails_db.helpers' do
      ActiveSupport.on_load :action_view do
        include RailsDb::Helpers
      end
    end
  end
end
