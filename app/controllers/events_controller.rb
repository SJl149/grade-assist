class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "New event was created successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error creating the event. Please try again."
      render :new
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:eventdate, :name)
  end
end
