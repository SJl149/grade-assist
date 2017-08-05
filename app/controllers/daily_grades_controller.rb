class DailyGradesController < ApplicationController
  respond_to :html, :json

  def index
    @student = Student.find(params[:student_id])
    @daily_grades = DailyGrade.where(student_id: @student)
  end

  def show
    @daily_grade = DailyGrade.find(params[:id])
  end

  def new
    @daily_grade = DailyGrade.new
  end

  def create

  end

  def edit
    @student = Student.find(params[:student_id])
    @daily_grade = DailyGrade.find(params[:id])
  end

  def destroy

  end

  def update
    @student = Student.find(params[:student_id])
    @daily_grade = DailyGrade.find(params[:id])
    if @daily_grade.update(daily_grade_params)
      flash[:notice] = "Grade was updated successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error updating grade. Please try again."
      render :edit
    end
    #respond_to do |format|
    #  if @daily_grade.update(daily_grade_params)
    #    format.html { redirect_to(root_path, :notice => 'Grade updated.') }
    #    format.json { respond_with_bip(@daily_grade)}
    #  else
    #    format.html { render :action => "edit" }
    #    format.json { respond_with_bip(@daily_grade) }
    #  end
    #end
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
    params.require(:daily_grade).permit(:attendance, :participation, :homework, :quiz, :comment, :exam)
  end
end
