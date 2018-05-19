require 'test_helper'

class TablesHelperTest < ActionView::TestCase
  include RailsDb::TablesHelper

  test "method column_is_checked? returns true for checkbox status if cookie does not contain hash_key for this table" do
    status = column_is_checked?('users', 'created_at')
    assert_equal true, status
  end

  test "method column_is_checked? returns true for checkbox status if cookie does not contain record for this table:column" do
    cookies['Table: users'] = 'created_at,'
    status = column_is_checked?('users', 'name')
    assert_equal true, status
  end

  test "method column_is_checked? returns false for checkbox status if cookie contains record for this table:column" do
    cookies['Table: users'] = 'created_at,'
    status = column_is_checked?('users', 'created_at')
    assert_equal false, status
  end

  test "method display_style_column returns 'display:none' if cookie contains record for this table:column" do
    cookies['Table: users'] = 'created_at,'
    style = display_style_column('users', 'created_at')
    assert_equal 'display:none', style
  end

  test "method display_style_column returns 'display' if cookie does not contain record for this table:column" do
    cookies['Table: users'] = 'created_at,'
    style = display_style_column('users', 'name')
    assert_equal 'display', style
  end

end