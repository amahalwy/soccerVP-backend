class ApplicationController < ActionController::API
  def current_user
    if !decoded_token.empty?
      user_id = decoded_token[0]["user_id"]
      @current_user ||= User.find_by(id: user_id) if user_id
      render json: @current_user
    end
  end
  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def auth_header
    request.headers["Authorization"]
  end

  def token
    if params[:access_token]
      params[:access_token]
    elsif auth_header.present?
      auth_header.split(" ")[1]
    end
  end

  def decoded_token
    if token.present?
      begin
        @decoded_token ||= JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: "HS256")
      rescue JWT::DecodeError
        @decoded_token ||= []
      end
    end

    @decoded_token ||= []
  end
end
