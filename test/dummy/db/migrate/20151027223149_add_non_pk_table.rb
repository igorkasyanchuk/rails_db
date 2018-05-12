klass = if Rails::VERSION::MAJOR < 5
  ActiveRecord::Migration
else
  ActiveRecord::Migration[4.2]
end

class AddNonPkTable < klass
  def change
    create_table :projects_users, id: false do |t|
      t.integer :project_id
      t.integer :user_id
    end
    add_index :projects_users, :project_id
    add_index :projects_users, :user_id
  end
end
