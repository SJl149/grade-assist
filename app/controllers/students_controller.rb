class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
    @semesters = @student.semesters.order('start_date DESC')
    @current_course = @student.courses.find_by(current: true)

    if @current_course.nil?
      @not_enrolled = true
    else
      @not_enrolled = false
      @current_semester = @student.semesters.find_by(name: @current_course.name)
      @current_daily_grades = @current_semester.daily_grades
    end
  end

  def index
    @students = Student.order(:family_name)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:notice] = "Student was updated successfully."
      redirect_to students_path
    else
      flash.now[:alert] = "Error updating student. Please try again."
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])

    if @student.destroy
      flash[:notice] = "#{@student.family_name}, #{@student.given_name} was deleted successfully."
      redirect_to students_path
    else
      flash.now[:alert] = "There was a problem deleting the student."
      redirect_to students_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:family_name, :given_name, :nickname)
  end

end
