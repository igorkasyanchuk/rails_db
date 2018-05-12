require 'test_helper'

class TableTest < ActiveSupport::TestCase

  def setup
    @users_table = RailsDb::Table.new('users')
  end

  test 'columns' do
    assert_equal @users_table.column_names, ["id", "name", "age", "salary", "bio", "created_at", "updated_at", "account_id", "dob", "active", "type"]
  end

  test 'to_csv' do
    User.create(name: 'igor')
    assert_not_equal @users_table.to_csv, ''
  end

  test 'truncate' do
    User.delete_all
    User.create(name: 'igor')
    assert_equal 1, User.count
    @users_table.truncate
    assert_equal 0, User.count
  end

  test 'primary_key' do
    assert_equal 'id', @users_table.primary_key
    projects_users_table = RailsDb::Table.new('projects_users')
    assert_nil projects_users_table.primary_key
  end

  test 'delete' do
    User.delete_all
    user_1 = User.create(name: 'igor')
    user_2 = User.create(name: 'john')
    assert_equal 2, User.count
    @users_table.delete(user_1.id)
    assert_equal 1, User.count
    assert_equal 0, User.where(name: 'igor').count
    assert_equal 1, User.where(name: 'john').count
  end

  test 'as_table' do
    User.delete_all
    user_1 = User.create(name: 'igor')

    klass = @users_table.as_model
    assert_equal 'igor', klass.first.name
  end

end
