require 'test_helper'

class RailsDbTest < ActiveSupport::TestCase
  def setup
    clean_db
  end

  test "truth" do
    assert_kind_of Module, RailsDb
  end

  test "verify_access_proc" do
    assert RailsDb.verify_access_proc.call(nil)
  end

end
