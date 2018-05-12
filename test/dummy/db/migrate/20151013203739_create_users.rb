class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.decimal :salary
      t.text :bio

      t.timestamps null: false
    end
  end
end
