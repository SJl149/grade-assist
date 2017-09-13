class Semester < ActiveRecord::Base
  belongs_to :student
  has_many :daily_grades

  def start_time
    self.start_date
  end


end
