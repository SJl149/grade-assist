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

esl_class = EslClass.new(
  name: 'iBT Toefl Summer 2017',
  user: user,
  student: student.sample
)

esl_class = EslClass.new(
  name: 'Intro to Toefl Summer 2017',
  user: user,
  student: student.sample
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Student.count} student created"
puts "#{EslClass.count} classes created"
