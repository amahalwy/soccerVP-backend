# frozen_string_literal: true

module TwilioClient
  include Rails.application.routes.url_helpers

  # THE TWILIO PHONE NUMBER YOU BOUGHT!
  MAIN_PHONE_NUMBER = "+14158535562".freeze
  MOHAMED_PHONE_NUMBER = "+14157696068".freeze
  AHMED_PHONE_NUMBER = "+14165625168".freeze

  def self.client
    debugger
    account_sid = Rails.env.production ? Rails.application.credentials.twilio_account_sid : ENV["TWILIO_ACCOUNT_SID"]
    auth_token = Rails.env.production ? Rails.application.credentials.twilio_auth_token : ENV["TWILIO_AUTH_TOKEN"]

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
