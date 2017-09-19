class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to events_path
    else
      flash.now[:alert] = "Error creating the event. Please try again."
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      flash[:notice] = "#{@event.name} was deleted successfully."
      redirect_to events_path
    else
      flash.now[:alert] = "There was a problem deleting the event."
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:eventdate, :name, :user_id)
  end
end
