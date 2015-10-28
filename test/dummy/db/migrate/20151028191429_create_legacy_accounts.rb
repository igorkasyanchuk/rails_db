class CreateLegacyAccounts < ActiveRecord::Migration
  def change
    create_table :legacy_accounts, :primary_key => :uuid do |t|
      t.string :name, uniq: true
    end
  end
end
