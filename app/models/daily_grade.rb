class DailyGrade < ActiveRecord::Base
  belongs_to :student, :counter_cache => true

  enum attendance: [:present, :late, :absent]
  enum participation: [:good, :avg, :poor]
  enum homework: [:full, :half, :zero]

end
