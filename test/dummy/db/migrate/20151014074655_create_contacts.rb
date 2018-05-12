class CreateContacts < ActiveRecord::Migration[4.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps null: false
    end
    Contact.create(name: 'John', email: 'john@email.com', message: 'Please call me')
    Contact.create(name: 'Bob', email: 'bob@site.com', message: 'I want to participate')
  end
end
