module RailsDb
  class Engine < ::Rails::Engine
    isolate_namespace RailsDb
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'any_login.assets_precompile', :group => :all do |app|
      app.config.assets.precompile += ['rails_db/logo_mini.png', 'rails_db/*', 'vendor/modernizr.js', 'rails_db/up_arrow.gif', 'rails_db/down_arrow.gif', 'rails_db/logo.png']
      app.config.assets.precompile += ["codemirror*", "codemirror/**/*"]
    end

    initializer 'rails_db.helpers' do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, RailsDb::RailsDbDataTableHelper
      end
    end
  end
end
