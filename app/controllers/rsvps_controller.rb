class RSVPsController < ApplicationController

  def show
    @rsvp = RSVP.find(params[:id])
  end

  def create
    @rsvp = RSVP.new(rsvp_params)
    
    if @rsvp.save
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
