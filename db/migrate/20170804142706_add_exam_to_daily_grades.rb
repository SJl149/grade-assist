class AddExamToDailyGrades < ActiveRecord::Migration
  def change
    add_column :daily_grades, :exam, :integer
  end
end
