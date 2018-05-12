class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string :name

      20.times do
        t.string "description_#{rand(1_000_000)}"
      end

      20.times do
        t.integer "amount_#{rand(1_000_000)}"
      end

      t.timestamps null: false
    end
    Project.create(name: 'Project 1')
    Project.create(name: 'Project 2')
  end
end
