require 'test_helper'

class TablesHelperTest < ActionView::TestCase
  include RailsDb::TablesHelper

  def setup
    clean_db
  end

  test "method checked returns true for checkbox status if cookie does not contain hash_key for this table" do
    params[:table_id] = 'users'
    status = column_is_checked?('created_at')
    assert_equal true, status
  end

  test "method checked returns true for checkbox status if cookie does not contain record for this table:column" do
    params[:table_id] = 'users'
    cookies['Table: users'] = 'created_at'
    status = column_is_checked?('name')
    assert_equal true, status
  end

  test "method checked returns false for checkbox status if cookie contains record for this table:column" do
    params[:table_id] = 'users'
    cookies['Table: users'] = 'created_at'
    status = column_is_checked?('created_at')
    assert_equal false, status
  end

end