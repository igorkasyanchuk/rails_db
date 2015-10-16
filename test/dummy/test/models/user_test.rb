# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  age        :integer
#  salary     :decimal(, )
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#  dob        :date
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
