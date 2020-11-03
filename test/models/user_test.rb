# == Schema Information
#
# Table name: users
#
#  id           :uuid             not null, primary key
#  email        :string
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  role         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_users_on_email         (email)
#  index_users_on_phone_number  (phone_number)
#  index_users_on_role          (role)
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
