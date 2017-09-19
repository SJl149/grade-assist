
class CreateStudentDailygrades
  def initialize(course, current_user)
    @course = course
    @user_id = current_user.id
  end

  def call
    # Generate course schedule(without holidays)
    course_schedule = []
    start_date = @course.start_date.to_date
    end_date = @course.end_date.to_date
    (start_date..end_date).each do |schedule_day|
      course_schedule << schedule_day if [1,2,3,4].include?(schedule_day.wday)
    end

    # Create daily_grades for each student for each classdate
    start_date = @course.start_date
    end_date = @course.end_date
    course_name = @course.name

    @course.students.each do |student|
      semester = Semester.create(
                   student: student,
                   start_date: start_date,
                   end_date: end_date,
                   name: course_name,
                   teacher_id: @user_id
                 )
      course_schedule.each do |classdate|
        DailyGrade.create(
          semester: semester,
          classdate: classdate
        )
      end
    end
  end

end
