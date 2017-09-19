class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @current_course = @student.courses.find_by(current: true)
    @current_semester = @student.semesters.find_by(name: @current_course.name)
    @semesters = @student.semesters.order('start_date DESC')
  end

  def index
    @students = Student.order(:nickname)
  end
end
