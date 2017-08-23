class Course < ActiveRecord::Base
  belongs_to :user

  has_many :enrollments
  has_many :students, through: :enrollments

  has_many :course_semesters
  has_many :semesters, through: :course_semesters

  validates :name, uniqueness: true

  accepts_nested_attributes_for :enrollments, allow_destroy: true
  accepts_nested_attributes_for :students, allow_destroy: true


end
