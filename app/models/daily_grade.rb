class DailyGrade < ActiveRecord::Base
  belongs_to :student

  enum attendance: [:present, :late, :absent]
  enum participation: [:good, :avg, :poor]
  enum homework: [:full, :half, :zero]
end
