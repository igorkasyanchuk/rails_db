require 'test_helper'
require 'axlsx_rails'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    User.delete_all
    Account.delete_all
    Customer.delete_all

    user      = User.create(name: 'Igor')
    edit_user = User.create(name: 'Edit')
    customer  = Customer.create(name: 'Customer 1', bio: 'this is bio text')

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

    assert_equal 3, User.count
    get "/rails/db/tables/users/destroy?pk_id=#{user.id}"
    assert_equal 302, status
    assert_equal 2, User.count

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

    xhr :get, '/rails/db/tables/users/edit?pk_id=' + edit_user.id.to_s
    assert_equal 200, status

    xhr :put, '/rails/db/tables/users/update?pk_id=' + edit_user.id.to_s, {record: { name: 'JOHN' }}
    assert_equal 200, status
    edit_user.reload
    assert_equal 'JOHN', edit_user.name

    xhr :get, '/rails/db/tables/users/new'
    assert_equal 200, status

    assert_equal 2, User.count
    xhr :post, '/rails/db/tables/users/create', {record: { name: 'XXX' }}
    assert_equal 200, status
    assert_equal 3, User.count

    xhr :get, '/rails/db/tables/users/edit?pk_id=' + customer.id.to_s
    assert_equal 200, status

    xhr :put, '/rails/db/tables/users/update?pk_id=' + customer.id.to_s, {record: { name: 'STI' }}
    assert_equal 200, status
    customer.reload
    assert_equal 'STI', customer.name
  end

end
