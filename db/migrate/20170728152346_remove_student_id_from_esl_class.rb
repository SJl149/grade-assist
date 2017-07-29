class RemoveStudentIdFromEslClass < ActiveRecord::Migration
  def up
    remove_column :esl_classes, :student_id
  end
  def down
    add_column :esl_classes, :student_id, :integer
  end
end
