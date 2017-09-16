class DailyGrade < ActiveRecord::Base
  belongs_to :semester

  default_scope {order('classdate ASC')}

  enum attendance: [:present, :late, :absent]
  enum participation: [:good, :avg, :poor]
  enum homework: [:full, :half, :zero]

  def self.for_date(date)
    date = date.to_date
    where(classdate: date.beginning_of_day..date.end_of_day).first
  end

  def self.for_semester(semester)
    where(classdate: semester.start_date..semester.end_date)
  end

  def self.for_past_semesters(semester)
    where.not(classdate: semester.start_date..semester.end_date)
  end
end
