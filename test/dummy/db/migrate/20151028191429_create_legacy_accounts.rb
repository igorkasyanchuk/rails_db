class CreateLegacyAccounts < ActiveRecord::Migration[4.2]
  def change
    create_table :legacy_accounts, :primary_key => :uuid do |t|
      t.string :name, uniq: true
    end
  end
end
