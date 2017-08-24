class SemestersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @semester = Semester.new
    @semester.holidays.build 
  end

  def create
    @semester = Semester.new(semester_params)

    if @semester.save
      flash[:notice] = "New semester was created successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error creating the course. Please try again."
      render :new
    end
  end

  private

  def semester_params
    params.require(:semester).permit(:name, :start_date, :end_date,
      holidays_attributes: [:id, :_destroy, :period])
  end
end
