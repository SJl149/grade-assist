class CreateDailyGrades < ActiveRecord::Migration
  def change
    create_table :daily_grades do |t|
      t.integer :attendance
      t.integer :class_work
      t.integer :homework
      t.integer :quiz
      t.string :comment
      t.integer :test

      t.timestamps null: false
    end
  end
end
