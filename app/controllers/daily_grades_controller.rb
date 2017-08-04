class DailyGradesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @daily_grades = DailyGrade.where(student_id: @student)
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def destroy

  end

  def update
    @student = Student.find(params[:student_id])
    @daily_grade = @student.daily_grades.last
    if @daily_grade.update(daily_grade_params)
      redirect_to attendance_path, notice: "Grade updated."
    end
  end

  def attendance
    @course = Course.first
  end

  def class_work
  end

  def homework
    @course = Course.first
  end

  def quizzes
  end

  private

  def daily_grade_params
    params.require(:daily_grade).permit(:attendance)
  end
end
