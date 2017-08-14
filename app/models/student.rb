class Student < ActiveRecord::Base
  has_many :enrollments, inverse_of: :student
  has_many :courses, through: :enrollments
  has_many :daily_grades

  validates :given_name, presence: true
  validates :family_name, presence: true

  def avg_participation
    ((daily_grades.where(participation: 0).count * 100)
      + (daily_grades.where(participation: 1).count * 50)) / daily_grades.count(:participation)
  end

  def avg_homework
    ((daily_grades.where(homework: 0).count * 100)
      + (daily_grades.where(homework: 1).count * 50)) / daily_grades.count(:homework)
  end

end
