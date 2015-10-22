require_relative 'test_helper'

class SqlImportTest < ActiveSupport::TestCase

  def setup
    clean_db
  end

  test "import" do
    assert_equal RailsDb::Database.tables, ["accounts", "comments", "contacts", "projects", "users"]
    file = File.open("#{Rails.root}/../test_sql_#{RailsDb::Database.adapter.adapter_name}.sql")
    importer = RailsDb::SqlImport.new(file)
    importer.import
    assert importer.result.ok?, "Import successfull?"
    assert_equal RailsDb::Database.tables, ["accounts", "comments", "contacts", "projects", 't', "users"]
  end

end
