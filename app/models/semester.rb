class Semester < ActiveRecord::Base
  has_many :course_semesters
  has_many :courses, through: :course_semesters

  has_many :holidays
end
