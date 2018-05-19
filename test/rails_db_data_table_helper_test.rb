require 'test_helper'

class RailsDbDataTableHelperTest < ActionView::TestCase
  include RailsDb::RailsDbDataTableHelper

  test "default rails_db_data_table works" do
    user = User.create(name: 'Igor')
    content = rails_db_data_table('users')
    assert_match /Igor/, content
    assert_no_match /BOB MARLEY/, content
  end

  test "default rails_db_data_table_sql works" do
    user = User.create(name: 'Igor')
    content = rails_db_data_table_sql('select * from users')
    assert_match /Igor/, content
    assert_no_match /BOB MARLEY/, content
  end

  test "rails_db_data_table works with many options" do
    user = User.create(name: 'Igor', age: 9999)
    content = rails_db_data_table('users', limit: 10, order_by: :id, order: :asc, header: false, footer: true, style: :bootstrap, columns: [:id, :name])
    assert_match /Igor/, content
    assert_no_match /BOB MARLEY/, content
    assert_no_match /9999/, content
  end

  test "rails_db_data_table_sql works with many options" do
    user = User.create(name: 'Igor')
    content = rails_db_data_table_sql('select * from users', header: false, footer: true, style: :bootstrap)
    assert_match /Igor/, content
    assert_no_match /BOB MARLEY/, content
  end

end