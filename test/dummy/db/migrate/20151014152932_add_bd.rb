class AddBd < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :dob, :date
    User.all.each do |user|
      user.dob = Date.today - rand(100).days
      user.save
    end
  end
end
