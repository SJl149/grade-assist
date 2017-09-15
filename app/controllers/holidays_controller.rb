class HolidaysController < ApplicationController
  def index
    @holidays = Holiday.all
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)

    if @holiday.save
      flash[:notice] = "New holiday was created successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error creating the holiday. Please try again."
      render :new
    end
  end

  private

  def holiday_params
    params.require(:holiday).permit(:period, :name)
  end
end
