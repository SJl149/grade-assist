class AddDailyGradesCountToStudent < ActiveRecord::Migration
  def change
    add_column :students, :daily_grades_count, :integer, default: 0

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
      UPDATE students
         SET daily_grades_count = (SELECT count(1)
                                     FROM daily_grades
                                    WHERE daily_grades.student_id = students.id)
    SQL
  end
end
