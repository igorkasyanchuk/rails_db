require 'test_helper'

class SqlImportTest < ActiveSupport::TestCase

  test "import" do
    ["accounts", "comments", "contacts", "legacy_accounts", "payments", "projects", "projects_users", "users"].each do |t|
      assert RailsDb::Database.tables.include?(t)
    end
    file = File.open("#{Rails.root}/../test_sql_#{RailsDb::Database.adapter.adapter_name}.sql")
    importer = RailsDb::SqlImport.new(file)
    importer.import
    assert importer.result.ok?, "Import successfull?"
    assert RailsDb::Database.tables.include?('t')
  end

end
