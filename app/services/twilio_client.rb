# frozen_string_literal: true

module TwilioClient
  include Rails.application.routes.url_helpers

  # THE TWILIO PHONE NUMBER YOU BOUGHT!
  MAIN_PHONE_NUMBER = "+14158535562".freeze
  MOHAMED_PHONE_NUMBER = "+14157696068".freeze
  AHMED_PHONE_NUMBER = "+14165625168".freeze

  def self.client
    account_sid = Rails.application.credentials.twilio_account_sid
    auth_token = Rails.application.credentials.twilio_auth_token

    Twilio::REST::Client.new account_sid, auth_token
  end

  def self.send_message(phone_number, body)
    client.messages.create(
      from: MAIN_PHONE_NUMBER,
      to: phone_number,
      body: Rails.env.production? ? body : "(DEV) #{body}"
    )
  end
end
