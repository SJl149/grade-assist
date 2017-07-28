class RenameEslClassesToCourses < ActiveRecord::Migration
  def change
    rename_table :esl_classes, :courses
  end
end
