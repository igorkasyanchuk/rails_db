require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    User.delete_all
    Account.delete_all

    user = User.create(name: 'Igor')
    account = Account.create(name: 'Igor')

    get '/rails/db'
    assert_equal 200, status
    RailsDb::Database.accessible_tables.each do |table|
      assert_match(table, response.body)
    end

    get '/rails/db/tables/users'
    assert_equal 200, status
    assert_match('age', response.body)

    get '/rails/db/tables/users/data'
    assert_equal 200, status
    assert_match('Igor', response.body)

    get '/rails/db/sql'
    assert_equal 200, status

    get '/rails/db/import'
    assert_equal 200, status

    get '/rails/db/data-table'
    assert_equal 200, status

    get '/'
    assert_equal 200, status

    get '/rails/db/tables/users/data?sort_column=id&sort_order=desc'
    assert_equal 200, status

    assert_equal 1, User.count
    get "/rails/db/tables/users/destroy?pk_id=#{user.id}"
    assert_equal 302, status
    assert_equal 0, User.count

    get '/rails/db/tables/users/csv'
    assert_equal 200, status

    get '/rails/db/standalone'
    assert_equal 200, status

    get '/rails/db/tables/users/xlsx.xls'
    assert_equal 200, status

    get '/rails/db/sql?sql=select+%2A+from+users+limit+10'
    assert_equal 200, status

    post '/rails/db/sql-csv.csv?sql=select+%2A+from+users+limit+10'
    assert_equal 200, status

    post '/rails/db/sql-xls.xls?sql=select+%2A+from+users+limit+10'
    assert_equal 200, status

    andriy = User.create(name: 'Andriy')
    xhr :get, "/rails/db/tables/users/edit_row?id=#{andriy.id}"
    assert_equal 200, status

    xhr :get, "/rails/db/tables/users/update_row?id=#{andriy.id}", { name: 'JOHN' }
    assert_equal 200, status
    andriy.reload
    assert_equal 'JOHN', andriy.name

  end

end