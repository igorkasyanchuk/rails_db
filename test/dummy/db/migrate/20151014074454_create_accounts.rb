class CreateAccounts < ActiveRecord::Migration[4.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :users_count

      t.timestamps null: false
    end
    add_column :users, :account_id, :integer
    add_index :users, :account_id
    Account.create(name: "XYZ", users_count: User.count)
    User.update_all(account_id: Account.first.id)
  end
end
