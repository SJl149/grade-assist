class CreateEslClasses < ActiveRecord::Migration
  def change
    create_table :esl_classes do |t|
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :student, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
