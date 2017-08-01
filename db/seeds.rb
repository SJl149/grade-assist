User.destroy_all
Student.destroy_all
Course.destroy_all
Enrollment.destroy_all

user = User.new(
  username: 'Scott',
  email: 'sjlteacher@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: 0
)
user.skip_confirmation!
user.save!

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

course1 = Course.create(
  name: 'iBT Toefl Summer 2017',
  user: user
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
