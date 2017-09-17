class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @semester = @course.name
    @students = @course.students.order(:family_name)
  end

  def index
    @past_courses = current_user.courses.where(:current => false)
  end

  def new
    @course = Course.new
    @course.enrollments.build
  end

  def create
    @course = current_user.courses.new(course_params)

    if @course.save
      create_student_dailygrades(@course)
      flash[:notice] = "Course was created successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error creating the course. Please try again."
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      flash[:notice] = "Course was updated successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Error updating course. Please try again."
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])

    if @course.destroy
      flash[:notice] = "#{@course.name} was deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was a problem deleting the course."
      redirect_to root_path
    end
  end

  def create_student_dailygrades(course)
    # Generate course schedule(without holidays)
    course_schedule = []
    start_date = course.start_date.to_date
    end_date = course.end_date.to_date
    (start_date..end_date).each do |schedule_day|
      course_schedule << schedule_day if [1,2,3,4].include?(schedule_day.wday)
    end

    # Create daily_grades for each student for each classdate
    start_date = course.start_date
    end_date = course.end_date
    course_name = course.name

    course.students.each do |student|
      semester = Semester.create(
                   student: student,
                   start_date: start_date,
                   end_date: end_date,
                   name: course_name
                 )
      course_schedule.each do |classdate|
        DailyGrade.create(
          semester: semester,
          classdate: classdate
        )
      end
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :name, :current, :start_date, :end_date,
      enrollments_attributes: [:id, :_destroy, :student_id, :course_id,
        student_attributes: [:id, :_destroy, :family_name, :given_name, :nickname,
          semesters_attributes: [:id, :_destroy, :student_id, :name, :start_date, :end_date,
            daily_grades_attributes: [:id, :_destroy, :semester, :classdate]
          ]
        ]
      ])
  end
end
