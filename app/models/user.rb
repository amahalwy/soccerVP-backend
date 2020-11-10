# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  email            :string
#  first_name       :string
#  last_name        :string
#  otp_code_sent_at :datetime
#  otp_secret_key   :string
#  phone_number     :string
#  role             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email         (email)
#  index_users_on_phone_number  (phone_number)
#  index_users_on_role          (role)
#
class User < ApplicationRecord
  DRIFT_LENGTH = 1_800 # 30 mins = 60 * 30

  attr_accessor :code

  has_one_time_password
  has_many :events
  has_many :rsvps

  enum role: {
    normal: 0,
    admin: 1,
  }

  phony_normalize :phone_number, default_country_code: "US"

  def send_otp_code
    message = "Your verification code is #{otp_code}"
    TwilioClient.send_message(self.phone_number, message)
  end

  def send_paypal_confirmation(event)
    m1 = "You are confirmed to play in #{event.location} at #{event.starts_at}!"
    m2 = " Reach out to #{event.user.first_name} at #{event.user.phone_number} for any questions."
    message = m1 + m2
    TwilioClient.send_message(self.phone_number, message)
  end

  def mail_otp_code
    UserMailer.confirmation_email(self).deliver_now
  end

  def otp_code_sent_at_expired?
    return true if otp_code_sent_at.nil?

    DateTime.current - DRIFT_LENGTH.seconds > otp_code_sent_at
  end
end
