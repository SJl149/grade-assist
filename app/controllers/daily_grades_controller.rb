class DailyGradesController < ApplicationController
  respond_to :html, :json

  def index
    @student = Student.find(params[:student])
    @daily_grades = DailyGrade.where(student_id: @student)
    @course = @student.courses.first
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
    @daily_grade = DailyGrade.find(params[:id])
    @student = Student.find(@daily_grade.student_id)
  end

  def destroy

  end

  def update
    @daily_grade = DailyGrade.find(params[:id])
    student = Student.find(@daily_grade.student_id)

    respond_to do |format|
      if @daily_grade.update(daily_grade_params)
        format.html { redirect_to(daily_grades_path(student: student), :notice => 'Grade updated.') }
        format.json { respond_with_bip(@daily_grade)}
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@daily_grade) }
      end
    end
  end

  def attendance
    att_part_hw_grades
  end

  def update_attendance
    att_part_hw_update_grades

    respond_to do |format|
      if @daily_grade.update(daily_grade_params)
        format.html { render partial: "attendance" }
        format.js
      else
        flash.now[:alert] = "Error updating attendance. Please try again."
        format.html { render :edit }
      end
    end
  end

  def participation
    att_part_hw_grades
  end

  def update_participation
    att_part_hw_update_grades

    respond_to do |format|
      if @daily_grade.update(daily_grade_params)
        format.html { render partial: "participation" }
        format.js
      else
        flash.now[:alert] = "Error updating participation. Please try again."
        format.html { render :edit }
      end
    end
  end

  def homework
    att_part_hw_grades
  end

  def update_homework
    att_part_hw_update_grades

    respond_to do |format|
      if @daily_grade.update(daily_grade_params)
        format.html { render partial: "homework" }
        format.js
      else
        flash.now[:alert] = "Error updating homework. Please try again."
        format.html { render :edit }
      end
    end
  end

  def att_part_hw_grades
    @course = Course.find(params[:course_id])
    @students = @course.students
    @daily_grades_date = params[:date] || @students.first.daily_grades.last.created_at
  end

  def att_part_hw_update_grades
    @course = Course.find(params[:course_id])
    @student = Student.find(params[:student_id])
    @daily_grade = @student.daily_grades.find_by(created_at: params[:date] || Date.today)
  end

  private

  def daily_grade_params
    params.require(:daily_grade).permit(:attendance, :participation, :homework, :quiz, :comment, :exam)
  end
end
