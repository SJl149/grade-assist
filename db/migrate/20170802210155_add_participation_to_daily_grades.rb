class AddParticipationToDailyGrades < ActiveRecord::Migration
  def change
    add_column :daily_grades, :participation, :integer
  end
end
