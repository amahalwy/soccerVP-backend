class RsvpsController < ApplicationController

  def show
    @rsvp = Rsvp.find(params[:id])
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    
    if @rsvp.save
      @user = User.find_by(id: params[:rsvp][:user_id])
      @user.send_paypal_confirmation(Event.find_by(id: @rsvp.event_id))
      
      render :show, status: :created
    else
      render json: @rsvp.errors, status: :unprocessable_entity
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:user_id, :event_id)
  end
end
