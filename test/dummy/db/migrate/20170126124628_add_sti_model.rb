klass = if Rails::VERSION::MAJOR < 5
  ActiveRecord::Migration
else
  ActiveRecord::Migration[4.2]
end

class AddStiModel < klass
  def change
    add_column :users, :type, :string
  end
end
