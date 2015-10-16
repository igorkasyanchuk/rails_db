module RailsDb
  class Engine < ::Rails::Engine
    isolate_namespace RailsDb
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'any_login.assets_precompile', :group => :all do |app|
      app.config.assets.precompile += ['vendor/modernizr.js', 'rails_db/up_arrow.gif', 'rails_db/down_arrow.gif']
      app.config.assets.precompile += ["codemirror*", "codemirror/**/*"]
    end
  end
end
