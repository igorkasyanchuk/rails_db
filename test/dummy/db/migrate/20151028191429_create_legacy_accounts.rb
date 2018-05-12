klass = if Rails::VERSION::MAJOR < 5
  ActiveRecord::Migration
else
  ActiveRecord::Migration[4.2]
end

class CreateLegacyAccounts < klass
  def change
    create_table :legacy_accounts, :primary_key => :uuid do |t|
      t.string :name, uniq: true
    end
  end
end
