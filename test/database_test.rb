require 'test_helper'

class DatabaseTest < ActiveSupport::TestCase

  test "tables" do
    ["accounts", "comments", "contacts", "legacy_accounts", "payments", "projects", "projects_users", "users"].each do |t|
      assert RailsDb::Database.tables.include?(t)
    end
  end

  test "accessible tables" do
    ["accounts", "comments", "contacts", "legacy_accounts", "payments", "projects", "projects_users", "users"].each do |t|
      assert RailsDb::Database.accessible_tables.include?(t)
    end
  end

  test 'adapter' do
    assert_not_equal RailsDb::Database.adapter.to_s, ""
  end
end
