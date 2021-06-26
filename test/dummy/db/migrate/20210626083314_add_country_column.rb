class AddCountryColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :country, :string
  end
end
