class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @lates = @student.daily_grades.where(attendance: 1)
    @absents = @student.daily_grades.where(attendance: 2)
    @course = @student.courses.first
  end

  def index
    @students = Student.order(:nickname)
  end
end
