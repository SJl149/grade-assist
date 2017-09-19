class DailyGradesController < ApplicationController
  respond_to :html, :json

  def index
    @student = Student.find(params[:student])
    @current_course = @student.courses.find_by(current: true)
    @past_courses = @student.courses.where(current: false)

    @current_semester = @student.semesters.find_by(name: @current_course.name)
    @current_daily_grades = @current_semester.daily_grades
    # @past_daily_grades = @student.daily_grades.for_past_semesters(@current_semester)
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
    @semester = Semester.find(@daily_grade.semester_id)
    @student = Student.find(@semester.student_id)
  end

  def update
    @daily_grade = DailyGrade.find(params[:id])
    semester = Semester.find(@daily_grade.semester_id)

    respond_to do |format|
      if @daily_grade.update(daily_grade_params)
        format.html { redirect_to(daily_grades_path(semester: semester), :notice => 'Grade updated.') }
        format.json { respond_with_bip(@daily_grade)}
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@daily_grade) }
      end
    end
  end

  def destroy

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
    @students = @course.students.order(:family_name)


    @daily_grades_date = params[:date]&.to_date || date_determiner
  end

  def att_part_hw_update_grades
    @course = Course.find(params[:course_id])
    @student = Student.find(params[:student_id])
    @semester = @student.semesters.find_by(name: @course.name)
    date = params[:date].to_date
    @daily_grade = @semester.daily_grades.find_by(classdate: date.beginning_of_day..date.end_of_day)
  end

  def date_determiner
    semester = Semester.find_by(name: @course.name)

    if Date.today >= semester.start_date && Date.today <= semester.end_date
      Date.today.to_date
    else
      @course.start_date.to_date
    end
  end

  private

  def daily_grade_params
    params.require(:daily_grade).permit(:attendance, :participation, :homework, :quiz, :comment, :exam, :classdate, :date)
  end
end
