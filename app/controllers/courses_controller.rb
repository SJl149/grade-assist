class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.course.new(course_params)

    if @course.save
      flash[:notice] = "Course was created successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error creating the course. Please try again."
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      enrollments_attributes: [:id, :_destroy, :student_id, :course_id],
      students_attributes: [:id, :_destroy, :name, :nickname])
  end
end
