require 'test_helper'

class TableTest < ActiveSupport::TestCase

  def setup
    clean_db
    @users_table = RailsDb::Table.new('users')
  end

  test 'columns' do
    assert_equal @users_table.column_names, ["id", "name", "age", "salary", "bio", "created_at", "updated_at", "account_id", "dob"]
  end

  test 'to_csv' do
    User.create(name: "igor")
    assert_not_equal @users_table.to_csv, ""
  end

end