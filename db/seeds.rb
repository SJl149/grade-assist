User.destroy_all
Student.destroy_all
EslClass.destroy_all
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
    name: Faker::Name.unique.name,
    nickname: Faker::Ancient.hero + Faker::Number.digit
  )
  student.save!
end
students_group1 = Student.first(15)
students_group2 = Student.all - students_group1

esl_class1 = EslClass.create(
  name: 'iBT Toefl Summer 2017',
  user: user
)
students_group1.each do |student|
  Enrollment.create(
    esl_class: esl_class1,
    student: student
  )
end
esl_class2 = EslClass.create(
  name: 'Intro to Toefl Summer 2017',
  user: user
)
students_group2.each do |student|
  Enrollment.create(
    esl_class: esl_class2,
    student: student
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Student.count} student created"
puts "#{EslClass.count} classes created"
puts "#{Enrollment.count} enrollments created"
