klass = if Rails::VERSION::MAJOR < 5
  ActiveRecord::Migration
else
  ActiveRecord::Migration[4.2]
end

class AddBooleanFieldToUser < klass
  def change
    add_column :users, :active, :boolean, default: true
  end
end
