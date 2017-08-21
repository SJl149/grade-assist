class RemoveDailyGradesCountFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :daily_grades_count
  end
  def down
    add_column :students, :daily_grades_count, :integer, default: 0
  end
end
