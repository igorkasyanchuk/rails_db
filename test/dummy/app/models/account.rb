# == Schema Information
#
# Table name: accounts
#
#  id          :integer          not null, primary key
#  name        :string
#  users_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Account < ActiveRecord::Base
end
