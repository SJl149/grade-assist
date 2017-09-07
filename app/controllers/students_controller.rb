class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @course = @student.courses.first
    @semester = @course.semesters.first
    @student_daily_grades = @student.daily_grades.for_semester(@semester)
    @lates = @student_daily_grades.where(attendance: 1)
    @absents = @student_daily_grades.where(attendance: 2)
  end

  def index
    @students = Student.order(:nickname)
  end
end
