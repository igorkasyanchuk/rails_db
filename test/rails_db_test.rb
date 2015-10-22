require 'test_helper'

class RailsDbTest < ActiveSupport::TestCase
  def setup
    clean_db
  end
  test "truth" do
    assert_kind_of Module, RailsDb
  end
end
