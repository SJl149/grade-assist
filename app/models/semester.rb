class Semester < ActiveRecord::Base
  has_many :course_semesters
  has_many :courses, through: :course_semesters

  has_many :holidays

  accepts_nested_attributes_for :holidays, allow_destroy: true, reject_if: :all_blank

  def start_time
    self.start_date
  end


end
