require_relative 'test_helper'

class SqlImportTest < ActiveSupport::TestCase

  test "import" do
    assert_equal RailsDb::Database.tables, ["accounts", "comments", "contacts", "projects", "users"]
    file = File.open("#{Rails.root}/../test_sql_sqlite.sql")
    importer = RailsDb::SqlImport.new(file)
    importer.import
    assert importer.result.ok?
    assert_equal RailsDb::Database.tables, ["accounts", "comments", "contacts", "projects", 't', "users"]
  end

end
