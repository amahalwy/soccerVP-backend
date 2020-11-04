class UsersController < ApplicationController
  def create
    @user = if params.dig(:user, :phone_number)
      User.find_or_initialize_by(
        phone_number: PhonyRails.normalize_number(params.dig(:user, :phone_number), country_code: "US"),
    ) else
        User.find_or_initialize_by(
          email: params.dig(:user, :email)
        )
    end

    if @user.save
      @user.send_otp_code

      render json: { message: "Success" }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    # @user = current_user
  end

  def update
    if params[:id] == "me"
      @user = current_user
    else
      @user = User.find(params[:id])
    end

    # TODO: Authorize users
    if @user.update(user_params)
      render json: { message: "Success" }
    else
      render json: { error: "Cannot update user" }, status: 402
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email)
  end
end
