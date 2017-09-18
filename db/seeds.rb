User.destroy_all
Student.destroy_all
Course.destroy_all
Enrollment.destroy_all
DailyGrade.destroy_all
Semester.destroy_all
Event.destroy_all

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

# Create Admin User
admin = User.new(
  username: 'Admin',
  email: 'admin@email.com',
  password: 'password',
  password_confirmation: 'password',
  role: 2
)
admin.skip_confirmation!
admin.save!

# Create Students
30.times do
  student = Student.new(
    given_name: Faker::Name.unique.first_name,
    family_name: Faker::Name.unique.last_name,
    nickname: Faker::Ancient.hero + Faker::Number.digit
  )
  student.save!
end
students_group1 = Student.first(15)
students_group2 = Student.all - students_group1

#Create Event
Event.create(
  eventdate: 8.days.ago.beginning_of_day,
  name: 'Founders Day',
  user: user
)

# Create M,T,W,Th schedule using class_days array and .days.ago assuming seed is run on Wed.
class_days = [0,1,2,6,7,8,9,13,14,15,16,20,22,23,24]

# Create course1
course1 = Course.create(
  name: 'iBT Toefl Summer 2017',
  start_date: 24.days.ago.beginning_of_day,
  end_date: 0.days.ago.beginning_of_day,
  user: user
)

# Create and Add Students to course1
students_group1.each do |student|
  Enrollment.create(
    course: course1,
    student: student
  )
  # Create Semester for course1
  semester1 = Semester.create(
    name: course1.name,
    start_date: course1.start_date,
    end_date: course1.end_date,
    student: student
  )

  # Create DailyGrades for students in semester(course1)
  x = [0, 1, 2]
  class_days.each do |i|
    if i == 8
      DailyGrade.create(
        semester_id: semester1.id,
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
        semester_id: semester1.id,
        classdate: i.days.ago.beginning_of_day
      )
    end
  end
end

# Create course2
course2 = Course.create(
  name: 'Intro to Toefl Summer 2017',
  start_date: 24.days.ago.beginning_of_day,
  end_date: 0.days.ago.beginning_of_day,
  user: user
)

# Create and Add Students to course2
students_group2.each do |student|
  Enrollment.create(
    course: course2,
    student: student
  )
  # Create Semester for course2
  semester2 = Semester.create(
    name: course2.name,
    start_date: course2.start_date,
    end_date: course2.end_date,
    student: student
  )

  # Create DailyGrades for students in semester(course2)
  x = [0, 1, 2]
  class_days.each do |i|
    if i == 8
      DailyGrade.create(
        semester_id: semester2.id,
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
        semester_id: semester2.id,
        classdate: i.days.ago.beginning_of_day
      )
    end
  end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Student.count} student created"
puts "#{Course.count} courses created"
puts "#{Enrollment.count} enrollments created"
puts "#{DailyGrade.count} daily_grades created"
puts "#{Semester.count} semesters created"
puts "#{Event.count} events created"
