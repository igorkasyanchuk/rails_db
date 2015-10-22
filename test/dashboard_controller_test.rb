require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    User.create(name: 'Igor')

    get '/rails/db'
    assert_equal 200, status
    RailsDb::Database.accessible_tables.each do |table|
      assert_match(table, response.body)
    end

    get '/rails/db/tables/users'
    assert_equal 200, status
    assert_match('varchar', response.body)

    get '/rails/db/tables/users/data'
    assert_equal 200, status
    assert_match('Igor', response.body)

    get '/rails/db/sql'
    assert_equal 200, status

    get '/rails/db/import'
    assert_equal 200, status
  end

end