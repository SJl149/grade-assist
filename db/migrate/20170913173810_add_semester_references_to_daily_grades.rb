class AddSemesterReferencesToDailyGrades < ActiveRecord::Migration
  def change
    add_reference :daily_grades, :semester, index: true, foreign_key: true
  end
end
