class Student < ActiveRecord::Base
  has_many :enrollments, inverse_of: :student
  has_many :courses, through: :enrollments
  validates :name, presence: true
  validates :nickname, presence: true
end
