class DailyGradesController < ApplicationController
  def index
    @daily_grades = DailyGrade.all
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
      redirect_to root_path, notice: 'Grade updated'
    end
  end

  private

  def daily_grade_params
    params.require(:daily_grade).permit(:attendance)
  end
end
