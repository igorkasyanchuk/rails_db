class AddBooleanFieldToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :active, :boolean, default: true
  end
end
