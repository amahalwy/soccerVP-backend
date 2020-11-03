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
class Event < ApplicationRecord
  belongs_to :user

  enum payment_type: {
    paypal: 1,
  }

  validates :payment_link, :payment_type, :starts_at, :ends_at, :max_participants, :location, :cost_per_participant, presence: true
  validates :cost_per_participant, :max_participants, numericality: { greater_than: 0 }
end
