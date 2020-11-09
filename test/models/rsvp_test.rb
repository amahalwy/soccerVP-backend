# == Schema Information
#
# Table name: rsvps
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :uuid
#  user_id    :uuid
#
# Indexes
#
#  index_rsvps_on_event_id  (event_id)
#  index_rsvps_on_user_id   (user_id)
#
require 'test_helper'

class RsvpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
