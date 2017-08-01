class Student < ActiveRecord::Base
  has_many :enrollments, inverse_of: :student
  has_many :courses, through: :enrollments
  validates :given_name, presence: true
  validates :family_name, presence: true
end
