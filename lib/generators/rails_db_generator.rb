class RailsDbGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  def copy_initializer
    template 'rails_db.rb', 'config/initializers/rails_db.rb'
  end
end