class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    render json: @events
  end

  # GET /events/1
  def show
    render :show, status: :created, location: @event
  end

  # POST /events
  def create
    new_params = event_params
    new_params[:payment_type] = new_params[:payment_type].to_i
    @event = Event.new(new_params)

    if @event.save
      @user = User.where(id: @event.user_id)
      render :show, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render :show, status: :ok, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(
        :id, :user_id, :location, :max_participants, :cost_per_participant,
        :payment_link,:payment_type, :starts_at, :ends_at
        )
    end
end
