class SessionsController < ApplicationController
  def create
    if params.dig(:phone_number)
      @user = User.find_by_phone_number(PhonyRails.normalize_number(params[:phone_number], country_code: "US"))
    end

    if @user&.authenticate_otp(params[:code].to_s, drift: User::DRIFT_LENGTH)
      @token = encode_payload({ user_id: @user.id })

      render :show, status: :created
    else
      # TODO: Invalid code, please check your entry or start over and we will send you a new code
      render json: format_errors(@user.errors), status: :unprocessable_entity
    end
  end

  private

    def encode_payload(payload)
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end
end
