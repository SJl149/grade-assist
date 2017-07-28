class Student < ActiveRecord::Base

  has_many :enrollments
  has_many :esl_classes, through: :enrollments
end
