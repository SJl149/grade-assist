User.destroy_all
Student.destroy_all
Course.destroy_all
Enrollment.destroy_all
DailyGrade.destroy_all
Semester.destroy_all
Holiday.destroy_all
CourseSemester.destroy_all

# Create User
user = User.new(
  username: 'Scott',
  email: 'sjlteacher@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: 0
)
user.skip_confirmation!
user.save!

# Create M,T,W,Th schedule using class_days array and .days.ago assuming seed is run on Wed.
class_days = [0,1,2,6,7,8,9,13,14,15,16,20,22,23,24]

# Create Students
30.times do
  student = Student.new(
    given_name: Faker::Name.unique.first_name,
    family_name: Faker::Name.unique.last_name,
    nickname: Faker::Ancient.hero + Faker::Number.digit
  )
  student.save!

  # Create DailyGrades
  x = [0, 1, 2]
  class_days.each do |i|
    if i == 8
      DailyGrade.create(
        student_id: student.id,
        comment: "Holiday",
        classdate: i.days.ago.beginning_of_day
      )
    else
      DailyGrade.create(
        attendance: x.sample,
        participation: x.sample,
        homework: x.sample,
        quiz: 85,
        comment: "Good work today.",
        exam: 90,
        student_id: student.id,
        classdate: i.days.ago.beginning_of_day
      )
    end
  end
end
students_group1 = Student.first(15)
students_group2 = Student.all - students_group1

# Create Semesters
semester = Semester.create(
  name: 'Summer 2017',
  start_date: 24.days.ago.beginning_of_day,
  end_date: 0.days.ago.beginning_of_day
)

#Create Holidays
Holiday.create(
  period: 8.days.ago.beginning_of_day,
  semester: semester,
  name: 'Founders Day'
)

# Create Courses
course1 = Course.create(
  name: 'iBT Toefl Summer 2017',
  user: user
)
CourseSemester.create(
  course: course1,
  semester: semester
)
students_group1.each do |student|
  Enrollment.create(
    course: course1,
    student: student
  )
end

course2 = Course.create(
  name: 'Intro to Toefl Summer 2017',
  user: user
)
CourseSemester.create(
  course: course2,
  semester: semester
)
students_group2.each do |student|
  Enrollment.create(
    course: course2,
    student: student
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Student.count} student created"
puts "#{Course.count} courses created"
puts "#{Enrollment.count} enrollments created"
puts "#{DailyGrade.count} daily_grades created"
puts "#{Semester.count} semesters created"
puts "#{Holiday.count} holidays created"
puts "#{CourseSemester.count} course_semesters created"
