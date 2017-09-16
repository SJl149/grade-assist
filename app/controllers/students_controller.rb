class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @current_course = @student.courses.find_by(current: true)

    @semesters = @student.semesters.all
  end

  def index
    @students = Student.order(:nickname)
  end
end
