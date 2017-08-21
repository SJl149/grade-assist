class DailyGrade < ActiveRecord::Base
  belongs_to :student

  enum attendance: [:present, :late, :absent]
  enum participation: [:good, :avg, :poor]
  enum homework: [:full, :half, :zero]

  def self.for_date(date)
    date = date.to_date
    where(created_at: date.beginning_of_day..date.end_of_day).first
  end
end
