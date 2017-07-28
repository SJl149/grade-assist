class Student < ActiveRecord::Base
  has_many :esl_classes
  has_many :users, through: :esl_classes, source: :esl_classes
end
