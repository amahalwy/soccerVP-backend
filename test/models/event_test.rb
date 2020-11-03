# == Schema Information
#
# Table name: events
#
#  id                   :uuid             not null, primary key
#  cost_per_participant :float
#  ends_at              :datetime
#  location             :string
#  max_participants     :integer
#  payment_link         :text
#  payment_type         :integer
#  starts_at            :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :uuid             not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
