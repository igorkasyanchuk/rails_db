require 'test_helper'

class TableDataTest < ActiveSupport::TestCase

  test 'find' do
    user = User.create(name: 'igor')
    users_table = RailsDb::Table.new('users')
    assert_equal users_table.find(user.id)['name'], 'igor'
    assert_equal users_table.find(user.id).keys, user.attributes.keys
  end

end