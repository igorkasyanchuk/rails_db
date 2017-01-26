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

class User < ActiveRecord::Base
  has_many :comments

  validates :name, presence: true
end
