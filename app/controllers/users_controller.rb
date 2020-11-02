class UsersController < ApplicationController
  def create

  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :gender, :number, :country, :city, :password, :email)
  end
end
