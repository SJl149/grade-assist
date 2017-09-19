class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
    @semesters = @student.semesters.order('start_date DESC')
    @current_course = @student.courses.find_by(current: true)
    @not_enrolled = false
    if @current_course.nil?
      @not_enrolled = true
    else
      @current_semester = @student.semesters.find_by(name: @current_course.name)
      @current_daily_grades = @current_semester.daily_grades
    end
  end

  def index
    @students = Student.order(:family_name)
  end

end
