module RailsDb
  class Engine < ::Rails::Engine
    isolate_namespace RailsDb
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'rails_db.assets_precompile', :group => :all do |app|
      app.config.assets.precompile += ['rails_db/application.js', 'rails_db/application.css', 'rails_db/*.png']
    end

    initializer 'rails_db.helpers' do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, RailsDb::RailsDbDataTableHelper
      end
    end
  end
end
