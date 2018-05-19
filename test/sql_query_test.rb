require 'test_helper'

class DatabaseTest < ActiveSupport::TestCase

  test "query" do
    User.delete_all
    User.create(name: 'Igor')
    query = RailsDb::SqlQuery.new('select count(*) as users_count from users')
    query.execute
    assert_equal query.data.columns, ['users_count']
    assert_equal query.data.rows.collect{|e| e.collect{|ee| ee.to_i}} , [[1]]
    assert_not_nil query.explain
  end

  test "insert" do
    query = RailsDb::SqlQuery.new('delete from projects_users')
    query.execute
    User.delete_all
    assert_equal 0, RailsDb::Database.count('projects_users')
    query = RailsDb::SqlQuery.new('insert into projects_users(project_id, user_id) values(1,2)')
    query.execute
    assert_equal query.data.columns, []
    assert_equal query.data.rows, []
    assert_not_nil query.explain
    assert_equal 1, RailsDb::Database.count('projects_users')
  end

end