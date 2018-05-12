klass = if Rails::VERSION::MAJOR < 5
  ActiveRecord::Migration
else
  ActiveRecord::Migration[4.2]
end

class CreatePayments < klass
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.integer :project_id

      t.timestamps null: false
    end
    add_index :payments, :project_id
    add_index :contacts, [:name, :email]
    add_index :users, [:name]
    add_index :users, [:salary]
  end
end
