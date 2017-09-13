class DropCourseSemesters < ActiveRecord::Migration
  def up
    drop_table :course_semesters
  end

  def down
    create_table :course_semesters do |t|
      t.references :course, index: true, foreign_key: true
      t.references :semester, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
