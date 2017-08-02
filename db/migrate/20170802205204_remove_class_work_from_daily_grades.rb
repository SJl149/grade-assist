class RemoveClassWorkFromDailyGrades < ActiveRecord::Migration
  def up
    remove_column :daily_grades, :class_work
  end
  def down
    add_column :daily_grades, :class_work, :integer
  end
end
