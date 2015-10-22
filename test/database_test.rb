require_relative 'test_helper'

class DatabaseTest < ActiveSupport::TestCase
  def setup
    clean_db
  end

  test "tables" do
    assert_equal RailsDb::Database.tables, ["accounts", "comments", "contacts", "projects", "users"]
  end

  test "accessible tables" do
    assert_equal RailsDb::Database.accessible_tables, ["accounts", "comments", "contacts", "projects", "users"]
  end

  test 'adapter' do
    assert_equal RailsDb::Database.adapter.to_s, "RailsDb::Adapters::Sqlite"
  end
end