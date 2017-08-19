class DailyGrade < ActiveRecord::Base
  belongs_to :student, :counter_cache => true

  enum attendance: [:present, :late, :absent]
  enum participation: [:good, :avg, :poor]
  enum homework: [:full, :half, :zero]

  scope :for_date, -> (date) { where('created_at >= ?', date.to_date.beginning_of_day).first }

end
