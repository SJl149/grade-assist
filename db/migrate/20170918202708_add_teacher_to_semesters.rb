class AddTeacherToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :teacher_id, :integer
  end
end
