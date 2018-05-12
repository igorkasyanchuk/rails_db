klass = if Rails::VERSION::MAJOR < 5
  ActiveRecord::Migration
else
  ActiveRecord::Migration[4.2]
end

class AddBd < klass
  def change
    add_column :users, :dob, :date
    User.all.each do |user|
      user.dob = Date.today - rand(100).days
      user.save
    end
  end
end
