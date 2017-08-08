class RemoveTestFromDailyGrades < ActiveRecord::Migration
  def up
    remove_column :daily_grades, :test
  end
  def down
    add_column :daily_grades, :test, :integer
  end
end
