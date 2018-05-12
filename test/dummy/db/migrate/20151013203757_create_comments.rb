klass = if Rails::VERSION::MAJOR < 5
  ActiveRecord::Migration
else
  ActiveRecord::Migration[4.2]
end

class CreateComments < klass
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
