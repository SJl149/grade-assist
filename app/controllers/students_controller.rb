class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @current_course = @student.courses.find_by(current: true)
    @past_courses = @student.courses.where(current: false)
    @current_semester = @current_course.semesters.first
    @current_student_daily_grades = @student.daily_grades.for_semester(@current_semester)
    @lates = @current_student_daily_grades.where(attendance: 1)
    @absents = @current_student_daily_grades.where(attendance: 2)
  end

  def index
    @students = Student.order(:nickname)
  end
end
