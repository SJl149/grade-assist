class Student < ActiveRecord::Base
  belongs_to :user
  has_many :enrollments, inverse_of: :student
  has_many :courses, through: :enrollments
  has_many :semesters

  validates :given_name, presence: true
  validates :family_name, presence: true

  accepts_nested_attributes_for :semesters, allow_destroy: true
end
