class User < ApplicationRecord
  DRIFT_LENGTH = 1_800 # 30 mins = 60 * 30

  enum role: {
    normal: 0,
    admin: 1,
  }

  phony_normalize :phone_number, default_country_code: "US"

  def send_otp_code
    message = "Your verification code is #{otp_code}"

    TwilioClient.send_message(phone_number, message)
  end

  def mail_otp_code
    UserMailer.confirmation_email(self).deliver_now
  end

  def otp_code_sent_at_expired?
    return true if otp_code_sent_at.nil?

    DateTime.current - DRIFT_LENGTH.seconds > otp_code_sent_at
  end
end
