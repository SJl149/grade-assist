class RemoveStudentReferencesFromDailyGrades < ActiveRecord::Migration
  def change
    remove_reference :daily_grades, :student, index: true, foreign_key: true
  end
end
