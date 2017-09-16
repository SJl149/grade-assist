class AddStudentReferencesToSemesters < ActiveRecord::Migration
  def change
    add_reference :semesters, :student, index: true, foreign_key: true
  end
end
