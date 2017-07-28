class RemoveEslClassIdFromEnrollments < ActiveRecord::Migration
  def up
    remove_column :enrollments, :esl_class_id
  end
  def down
    add_column :enrollments, :esl_class_id, :integer
  end
end
