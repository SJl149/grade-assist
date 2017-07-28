class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :esl_class
end
