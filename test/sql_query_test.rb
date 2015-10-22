require_relative 'test_helper'

class DatabaseTest < ActiveSupport::TestCase

  def setup
    clean_db
  end

  test "query" do
    User.create(name: 'Igor')
    query = RailsDb::SqlQuery.new('select count(*) as users_count from users')
    query.execute
    assert_equal query.data.columns, ['users_count']
    assert_equal query.data.rows, [[1]]
    assert_not_nil query.explain
  end

end