class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @semester = @course.name
    @students = @course.students.order(:family_name)
  end

  def index
    @past_courses = current_user.courses.where(:current => false)
  end

  def new
    @course = Course.new
    @course.enrollments.build
  end

  def create
    @course = current_user.courses.new(course_params)

    if @course.save
      CreateStudentDailygrades.new(@course).call
      flash[:notice] = "Course was created successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error creating the course. Please try again."
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      flash[:notice] = "Course was updated successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error updating course. Please try again."
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])

    if @course.destroy
      flash[:notice] = "#{@course.name} was deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was a problem deleting the course."
      redirect_to root_path
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :name, :current, :start_date, :end_date,
      enrollments_attributes: [:id, :_destroy, :student_id, :course_id,
        student_attributes: [:id, :_destroy, :family_name, :given_name, :nickname,
          semesters_attributes: [:id, :_destroy, :student_id, :name, :start_date, :end_date,
            daily_grades_attributes: [:id, :_destroy, :semester, :classdate]
          ]
        ]
      ])
  end
end
