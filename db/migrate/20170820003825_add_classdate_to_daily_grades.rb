class AddClassdateToDailyGrades < ActiveRecord::Migration
  def change
    add_column :daily_grades, :classdate, :datetime
  end
end
